#include <chrono>
#include "paddle_api.h" // NOLINT
#include "paddle_place.h"

#include "cls_process.h"
#include "crnn_process.h"
#include "db_post_process.h"
#include "utils.h"
#include "ocr_db_crnn.h"
#include "AutoLog/auto_log/lite_autolog.h"

using namespace paddle::lite_api; // NOLINT
using namespace std;


// fill tensor with mean and scale and trans layout: nhwc -> nchw, neon speed up
void NeonMeanScale(const float *din, float *dout, int size,
                   const std::vector<float> mean,
                   const std::vector<float> scale) {
  if (mean.size() != 3 || scale.size() != 3) {
    std::cerr << "[ERROR] mean or scale size must equal to 3" << std::endl;
    exit(1);
  }
  float32x4_t vmean0 = vdupq_n_f32(mean[0]);
  float32x4_t vmean1 = vdupq_n_f32(mean[1]);
  float32x4_t vmean2 = vdupq_n_f32(mean[2]);
  float32x4_t vscale0 = vdupq_n_f32(scale[0]);
  float32x4_t vscale1 = vdupq_n_f32(scale[1]);
  float32x4_t vscale2 = vdupq_n_f32(scale[2]);

  float *dout_c0 = dout;
  float *dout_c1 = dout + size;
  float *dout_c2 = dout + size * 2;

  int i = 0;
  for (; i < size - 3; i += 4) {
    float32x4x3_t vin3 = vld3q_f32(din);
    float32x4_t vsub0 = vsubq_f32(vin3.val[0], vmean0);
    float32x4_t vsub1 = vsubq_f32(vin3.val[1], vmean1);
    float32x4_t vsub2 = vsubq_f32(vin3.val[2], vmean2);
    float32x4_t vs0 = vmulq_f32(vsub0, vscale0);
    float32x4_t vs1 = vmulq_f32(vsub1, vscale1);
    float32x4_t vs2 = vmulq_f32(vsub2, vscale2);
    vst1q_f32(dout_c0, vs0);
    vst1q_f32(dout_c1, vs1);
    vst1q_f32(dout_c2, vs2);

    din += 12;
    dout_c0 += 4;
    dout_c1 += 4;
    dout_c2 += 4;
  }
  for (; i < size; i++) {
    *(dout_c0++) = (*(din++) - mean[0]) * scale[0];
    *(dout_c1++) = (*(din++) - mean[1]) * scale[1];
    *(dout_c2++) = (*(din++) - mean[2]) * scale[2];
  }
}

// resize image to a size multiple of 32 which is required by the network
cv::Mat DetResizeImg(const cv::Mat img, int max_size_len,
                     std::vector<float> &ratio_hw) {
  int w = img.cols;
  int h = img.rows;

  float ratio = 1.f;
  int max_wh = w >= h ? w : h;
  if (max_wh > max_size_len) {
    if (h > w) {
      ratio = static_cast<float>(max_size_len) / static_cast<float>(h);
    } else {
      ratio = static_cast<float>(max_size_len) / static_cast<float>(w);
    }
  }

  int resize_h = static_cast<int>(float(h) * ratio);
  int resize_w = static_cast<int>(float(w) * ratio);
  if (resize_h % 32 == 0)
    resize_h = resize_h;
  else if (resize_h / 32 < 1 + 1e-5)
    resize_h = 32;
  else
    resize_h = (resize_h / 32 - 1) * 32;

  if (resize_w % 32 == 0)
    resize_w = resize_w;
  else if (resize_w / 32 < 1 + 1e-5)
    resize_w = 32;
  else
    resize_w = (resize_w / 32 - 1) * 32;

  cv::Mat resize_img;
  cv::resize(img, resize_img, cv::Size(resize_w, resize_h));

  ratio_hw.push_back(static_cast<float>(resize_h) / static_cast<float>(h));
  ratio_hw.push_back(static_cast<float>(resize_w) / static_cast<float>(w));
  return resize_img;
}

cv::Mat RunClsModel(cv::Mat img, std::shared_ptr<PaddlePredictor> predictor_cls,
                    const float thresh) {
  std::vector<float> mean = {0.5f, 0.5f, 0.5f};
  std::vector<float> scale = {1 / 0.5f, 1 / 0.5f, 1 / 0.5f};

  cv::Mat srcimg;
  img.copyTo(srcimg);
  cv::Mat crop_img;
  img.copyTo(crop_img);
  cv::Mat resize_img;

  int index = 0;
  float wh_ratio =
      static_cast<float>(crop_img.cols) / static_cast<float>(crop_img.rows);

  resize_img = ClsResizeImg(crop_img);
  resize_img.convertTo(resize_img, CV_32FC3, 1 / 255.f);

  const float *dimg = reinterpret_cast<const float *>(resize_img.data);

  std::unique_ptr<Tensor> input_tensor0(std::move(predictor_cls->GetInput(0)));
  input_tensor0->Resize({1, 3, resize_img.rows, resize_img.cols});
  auto *data0 = input_tensor0->mutable_data<float>();

  NeonMeanScale(dimg, data0, resize_img.rows * resize_img.cols, mean, scale);
  // Run CLS predictor
  predictor_cls->Run();

  // Get output and run postprocess
  std::unique_ptr<const Tensor> softmax_out(
      std::move(predictor_cls->GetOutput(0)));
  auto *softmax_scores = softmax_out->mutable_data<float>();
  auto softmax_out_shape = softmax_out->shape();
  float score = 0;
  int label = 0;
  for (int i = 0; i < softmax_out_shape[1]; i++) {
    if (softmax_scores[i] > score) {
      score = softmax_scores[i];
      label = i;
    }
  }
  if (label % 2 == 1 && score > thresh) {
    cv::rotate(srcimg, srcimg, 1);
  }
  return srcimg;
}

void RunRecModel(std::vector<std::vector<std::vector<int>>> boxes, cv::Mat img,
                 std::shared_ptr<PaddlePredictor> predictor_crnn,
                 std::vector<std::string> &rec_text,
                 std::vector<float> &rec_text_score,
                 std::vector<std::string> charactor_dict,
                 int use_direction_classify,
                 std::vector<double> *times,
                 int rec_image_height) {
  std::vector<float> mean = {0.5f, 0.5f, 0.5f};
  std::vector<float> scale = {1 / 0.5f, 1 / 0.5f, 1 / 0.5f};

  cv::Mat srcimg;
  img.copyTo(srcimg);
  cv::Mat crop_img;
  cv::Mat resize_img;

  int index = 0;

  std::vector<double> time_info = {0, 0, 0};
  for (int i = boxes.size() - 1; i >= 0; i--) {
    auto preprocess_start = std::chrono::steady_clock::now();
    crop_img = GetRotateCropImage(srcimg, boxes[i]);
    float wh_ratio =
        static_cast<float>(crop_img.cols) / static_cast<float>(crop_img.rows);

    resize_img = CrnnResizeImg(crop_img, wh_ratio, rec_image_height);
    resize_img.convertTo(resize_img, CV_32FC3, 1 / 255.f);

    const float *dimg = reinterpret_cast<const float *>(resize_img.data);

    std::unique_ptr<Tensor> input_tensor0(
        std::move(predictor_crnn->GetInput(0)));
    input_tensor0->Resize({1, 3, resize_img.rows, resize_img.cols});
    auto *data0 = input_tensor0->mutable_data<float>();

    NeonMeanScale(dimg, data0, resize_img.rows * resize_img.cols, mean, scale);
    auto preprocess_end = std::chrono::steady_clock::now();
    //// Run CRNN predictor
    auto inference_start = std::chrono::steady_clock::now();
    predictor_crnn->Run();

    // Get output and run postprocess
    std::unique_ptr<const Tensor> output_tensor0(
        std::move(predictor_crnn->GetOutput(0)));
    auto *predict_batch = output_tensor0->data<float>();
    auto predict_shape = output_tensor0->shape();
    auto inference_end = std::chrono::steady_clock::now();

    // ctc decode
    auto postprocess_start = std::chrono::steady_clock::now();
    std::string str_res;
    int argmax_idx;
    int last_index = 0;
    float score = 0.f;
    int count = 0;
    float max_value = 0.0f;

    for (int n = 0; n < predict_shape[1]; n++) {
      argmax_idx = int(Argmax(&predict_batch[n * predict_shape[2]],
                              &predict_batch[(n + 1) * predict_shape[2]]));
      max_value =
          float(*std::max_element(&predict_batch[n * predict_shape[2]],
                                  &predict_batch[(n + 1) * predict_shape[2]]));
      if (argmax_idx > 0 && (!(n > 0 && argmax_idx == last_index))) {
        score += max_value;
        count += 1;
        str_res += charactor_dict[argmax_idx];
      }
      last_index = argmax_idx;
    }
    score /= count;
    rec_text.push_back(str_res);
    rec_text_score.push_back(score);
    auto postprocess_end = std::chrono::steady_clock::now();

    std::chrono::duration<float> preprocess_diff = preprocess_end - preprocess_start;
    time_info[0] += double(preprocess_diff.count() * 1000);
    std::chrono::duration<float> inference_diff = inference_end - inference_start;
    time_info[1] += double(inference_diff.count() * 1000);
    std::chrono::duration<float> postprocess_diff = postprocess_end - postprocess_start;
    time_info[2] += double(postprocess_diff.count() * 1000);

  }

times->push_back(time_info[0]);
times->push_back(time_info[1]);
times->push_back(time_info[2]);
}

std::vector<std::vector<std::vector<int>>>
RunDetModel(std::shared_ptr<PaddlePredictor> predictor, cv::Mat img,
            std::map<std::string, double> Config, std::vector<double> *times) {
  // Read img
  int max_side_len = int(Config["max_side_len"]);
  int det_db_use_dilate = int(Config["det_db_use_dilate"]);

  cv::Mat srcimg;
  img.copyTo(srcimg);
  
  auto preprocess_start = std::chrono::steady_clock::now();
  std::vector<float> ratio_hw;
  img = DetResizeImg(img, max_side_len, ratio_hw);
  cv::Mat img_fp;
  img.convertTo(img_fp, CV_32FC3, 1.0 / 255.f);

  // Prepare input data from image
  std::unique_ptr<Tensor> input_tensor0(std::move(predictor->GetInput(0)));
  input_tensor0->Resize({1, 3, img_fp.rows, img_fp.cols});
  auto *data0 = input_tensor0->mutable_data<float>();

  std::vector<float> mean = {0.485f, 0.456f, 0.406f};
  std::vector<float> scale = {1 / 0.229f, 1 / 0.224f, 1 / 0.225f};
  const float *dimg = reinterpret_cast<const float *>(img_fp.data);
  NeonMeanScale(dimg, data0, img_fp.rows * img_fp.cols, mean, scale);
  auto preprocess_end = std::chrono::steady_clock::now();

  // Run predictor
  auto inference_start = std::chrono::steady_clock::now();
  predictor->Run();

  // Get output and post process
  std::unique_ptr<const Tensor> output_tensor(
      std::move(predictor->GetOutput(0)));
  auto *outptr = output_tensor->data<float>();
  auto shape_out = output_tensor->shape();
  auto inference_end = std::chrono::steady_clock::now();

  // Save output
  auto postprocess_start = std::chrono::steady_clock::now();
  float pred[shape_out[2] * shape_out[3]];
  unsigned char cbuf[shape_out[2] * shape_out[3]];

  for (int i = 0; i < int(shape_out[2] * shape_out[3]); i++) {
    pred[i] = static_cast<float>(outptr[i]);
    cbuf[i] = static_cast<unsigned char>((outptr[i]) * 255);
  }

  cv::Mat cbuf_map(shape_out[2], shape_out[3], CV_8UC1,
                   reinterpret_cast<unsigned char *>(cbuf));
  cv::Mat pred_map(shape_out[2], shape_out[3], CV_32F,
                   reinterpret_cast<float *>(pred));

  const double threshold = double(Config["det_db_thresh"]) * 255;
  const double max_value = 255;
  cv::Mat bit_map;
  cv::threshold(cbuf_map, bit_map, threshold, max_value, cv::THRESH_BINARY);
  if (det_db_use_dilate == 1) {
    cv::Mat dilation_map;
    cv::Mat dila_ele =
        cv::getStructuringElement(cv::MORPH_RECT, cv::Size(2, 2));
    cv::dilate(bit_map, dilation_map, dila_ele);
    bit_map = dilation_map;
  }
  auto boxes = BoxesFromBitmap(pred_map, bit_map, Config);

  std::vector<std::vector<std::vector<int>>> filter_boxes =
      FilterTagDetRes(boxes, ratio_hw[0], ratio_hw[1], srcimg);
  auto postprocess_end = std::chrono::steady_clock::now();

  std::chrono::duration<float> preprocess_diff = preprocess_end - preprocess_start;
  times->push_back(double(preprocess_diff.count() * 1000));
  std::chrono::duration<float> inference_diff = inference_end - inference_start;
  times->push_back(double(inference_diff.count() * 1000));
  std::chrono::duration<float> postprocess_diff = postprocess_end - postprocess_start;
  times->push_back(double(postprocess_diff.count() * 1000));

  return filter_boxes;
}

std::shared_ptr<PaddlePredictor> loadModel(std::string model_file, int num_threads) {
  MobileConfig config;
  config.set_model_from_file(model_file);

  config.set_threads(num_threads);
  std::shared_ptr<PaddlePredictor> predictor =
      CreatePaddlePredictor<MobileConfig>(config);
  return predictor;
}

cv::Mat Visualization(cv::Mat srcimg,
                      std::vector<std::vector<std::vector<int>>> boxes) {
  cv::Point rook_points[boxes.size()][4];
  for (int n = 0; n < boxes.size(); n++) {
    for (int m = 0; m < boxes[0].size(); m++) {
      rook_points[n][m] = cv::Point(static_cast<int>(boxes[n][m][0]),
                                    static_cast<int>(boxes[n][m][1]));
    }
  }
  cv::Mat img_vis;
  srcimg.copyTo(img_vis);
  for (int n = 0; n < boxes.size(); n++) {
    const cv::Point *ppt[1] = {rook_points[n]};
    int npt[] = {4};
    cv::polylines(img_vis, ppt, npt, 1, 1, CV_RGB(0, 255, 0), 2, 8, 0);
  }

  return img_vis;
}

std::vector<std::string> split(const std::string &str,
                               const std::string &delim) {
  std::vector<std::string> res;
  if ("" == str)
    return res;
  char *strs = new char[str.length() + 1];
  std::strcpy(strs, str.c_str());

  char *d = new char[delim.length() + 1];
  std::strcpy(d, delim.c_str());

  char *p = std::strtok(strs, d);
  while (p) {
    string s = p;
    res.push_back(s);
    p = std::strtok(NULL, d);
  }

  return res;
}

std::map<std::string, double> LoadConfigTxt(std::string config_path) {
  auto config = ReadDict(config_path);

  std::map<std::string, double> dict;
  for (int i = 0; i < config.size(); i++) {
    std::vector<std::string> res = split(config[i], " ");
    dict[res[0]] = stod(res[1]);
  }
  return dict;
}

///sdcard/123/utils
///sdcard/123/utils/det_slim_opt.nb
std::vector<std::pair<std::string, double>> system(const cv::Mat &img1, const cv::Mat &img2) {
  std::string det_model_file = "/data/local/tmp/debug_v7/utils/det_slim_opt.nb";
  std::string rec_model_file = "/data/local/tmp/debug_v7/utils/rec_slim_opt.nb";
  std::string cls_model_file = "";
  std::string runtime_device = "arm8";
  std::string precision = "INT8";
  std::string num_threads = "10";
  std::string batchsize = "1";
  std::string det_config_path = "/data/local/tmp/debug_v7/utils/config.txt";
  std::string dict_path = "/data/local/tmp/debug_v7/utils/en_dict.txt";

  std::vector<cv::Mat> cv_all_imgs{img1, img2};

  //// load config from txt file
  auto Config = LoadConfigTxt(det_config_path);
  int use_direction_classify = int(Config["use_direction_classify"]);
  int rec_image_height = int(Config["rec_image_height"]);
  auto charactor_dict = ReadDict(dict_path);
  charactor_dict.insert(charactor_dict.begin(), "#"); // blank char for ctc
  charactor_dict.push_back(" ");

  auto det_predictor = loadModel(det_model_file, std::stoi(num_threads));
  auto rec_predictor = loadModel(rec_model_file, std::stoi(num_threads));

  std::vector<double> det_time_info = {0, 0, 0};
  std::vector<double> rec_time_info = {0, 0, 0};


  std::vector<std::pair<std::string, double>> results;
  for (int i = 0; i < 2; ++i) {
    cv::Mat srcimg = cv_all_imgs[i];

    std::vector<double> det_times;
    auto boxes = RunDetModel(det_predictor, srcimg, Config, &det_times);
  
    std::vector<std::string> rec_text;
    std::vector<float> rec_text_score;
  
    std::vector<double> rec_times;

    RunRecModel(boxes, srcimg, rec_predictor, rec_text, rec_text_score,
                charactor_dict, use_direction_classify, &rec_times, rec_image_height);

    //// visualization
    auto img_vis = Visualization(srcimg, boxes);
  
    std::string text;
    double score = 0;
    //// print recognized text
    for (int i = 0; i < rec_text.size(); i++) {
      text += rec_text[i];
      score += rec_text_score[i];
      // std::cout << i << "\t" << rec_text[i] << "\t" << rec_text_score[i]
      //           <<  std::endl;
    }
    results.push_back(std::pair<std::string, double>(text, score));

    // det_time_info[0] += det_times[0];
    // det_time_info[1] += det_times[1];
    // det_time_info[2] += det_times[2];
    // rec_time_info[0] += rec_times[0];
    // rec_time_info[1] += rec_times[1];
    // rec_time_info[2] += rec_times[2];
  

  }
  
  // AutoLogger autolog_det(det_model_file, 
  //                      runtime_device,
  //                      std::stoi(num_threads),
  //                      std::stoi(batchsize), 
  //                      "dynamic", 
  //                      precision, 
  //                      det_time_info, 
  //                      cv_all_imgs.size());
  // AutoLogger autolog_rec(rec_model_file, 
  //                      runtime_device,
  //                      std::stoi(num_threads),
  //                      std::stoi(batchsize), 
  //                      "dynamic", 
  //                      precision, 
  //                      rec_time_info, 
  //                      cv_all_imgs.size());

  // autolog_det.report();
  // std::cout << std::endl;
  // autolog_rec.report();
  
  return results;

}


std::string cap2str(cv::Mat cap) {
  // check_params(argc, argv);
  // std::string title_path("./utils/11.jpg");
  // cv::Mat title = cv::imread(title_path);

  cv::Mat binary = two_valuing(cap, thresh); 
  cv::Mat img1, img2;
  spin(binary, img1, img2);

  cv::cvtColor(img1, img1, cv::COLOR_GRAY2BGR);
  cv::cvtColor(img2, img2, cv::COLOR_GRAY2BGR); 

  std::vector<std::pair<std::string, double>> outputs = system(img1, img2);
  std::string ret = outputs[0].second > outputs[1].second ? outputs[0].first : outputs[1].first;
  if (ret.size() > 8) {
    cout << "Oops! The num of output string is over 8!" << endl;
    ret = string(ret.begin(), ret.begin() + 8);
	}
  std::transform(ret.begin(), ret.end(), ret.begin(), [](char const &c) {
                    return std::toupper(c);
                });

  return ret;
}
