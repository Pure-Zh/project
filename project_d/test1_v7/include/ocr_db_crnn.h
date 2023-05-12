#pragma once
#include <chrono>
#include "paddle_api.h" // NOLINT
#include "paddle_place.h"

#include "cls_process.h"
#include "crnn_process.h"
#include "db_post_process.h"
#include "utils.h"
#include "AutoLog/auto_log/lite_autolog.h"

using namespace paddle::lite_api; // NOLINT
using namespace std;

void NeonMeanScale(const float *din, float *dout, int size,
                   const std::vector<float> mean,
                   const std::vector<float> scale);

cv::Mat DetResizeImg(const cv::Mat img, int max_size_len,
                     std::vector<float> &ratio_hw);

cv::Mat RunClsModel(cv::Mat img, std::shared_ptr<PaddlePredictor> predictor_cls,
                    const float thresh = 0.9);

void RunRecModel(std::vector<std::vector<std::vector<int>>> boxes, cv::Mat img,
                 std::shared_ptr<PaddlePredictor> predictor_crnn,
                 std::vector<std::string> &rec_text,
                 std::vector<float> &rec_text_score,
                 std::vector<std::string> charactor_dict,
                 int use_direction_classify,
                 std::vector<double> *times,
                 int rec_image_height);


std::vector<std::vector<std::vector<int>>>
RunDetModel(std::shared_ptr<PaddlePredictor> predictor, cv::Mat img,
            std::map<std::string, double> Config, std::vector<double> *times);


std::shared_ptr<PaddlePredictor> loadModel(std::string model_file, int num_threads);

cv::Mat Visualization(cv::Mat srcimg,
                      std::vector<std::vector<std::vector<int>>> boxes);

std::vector<std::string> split(const std::string &str,
                               const std::string &delim);

std::map<std::string, double> LoadConfigTxt(std::string config_path);
std::vector<std::pair<std::string, double>> system(std::vector<cv::Mat> &cv_all_imgs, const string tool); 
std::string cap2str(cv::Mat cap, const string tool_path);
