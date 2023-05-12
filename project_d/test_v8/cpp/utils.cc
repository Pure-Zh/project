#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <cmath>
#include <algorithm>
#include "utils.h"
#include "ocr_db_crnn.h"
#include <android/log.h>

using std::string;
using std::vector;
using std::cos;
using std::sin;
using std::atan2;
using std::map;
using std::pair;
using std::endl;
using std::cout;

using cv::Mat;
using cv::Rect;
using cv::Point;

#define PI 3.1415926535
const float scalingfactor = 138.28;

Mat newcam_mtx = (Mat_<double>(3, 3) << 2.63797676e+04, 0.00000000e+00, 1.04655382e+03,
    0.00000000e+00, 2.41409961e+04, 1.20918688e+03,
    0.00000000e+00, 0.00000000e+00, 1.00000000e+00);
Mat inverse_newcam_mtx = newcam_mtx.inv();

Mat tvec1 = (Mat_<double>(3, 1) << 6.96596514, 3.19605319, 143.59501265);

Mat R_mtx = (Mat_<double>(3, 3) << -0.12765192, -0.88343605, -0.45082783,
    -0.97731071, 0.03457677, 0.20896941,
    -0.16902294, 0.46727421, -0.86780531);
Mat inverse_R_mtx = R_mtx.inv();



cv::Mat two_valuing(const cv::Mat &img, const int thresh)
{
    cv::Mat grey, result;

    cv::cvtColor(img, grey, cv::COLOR_BGR2GRAY);
    cv::threshold(grey, result, thresh, 255, cv::THRESH_BINARY);
    return result; 
}

cv::Mat two_valuing(const string &pic_dir, const int thresh)
{
    cv::Mat src=cv::imread(pic_dir);
    cv::Mat grey, result;
    if(src.empty())
    {
    	printf("Failed to load image\n");
    }
    cv::cvtColor(src, grey, cv::COLOR_BGR2GRAY);
    cv::threshold(grey, result, thresh, 255, cv::THRESH_BINARY);
    return result; 
}

int rotateImage(const cv::Mat &src, cv::Mat &dst, const double angle, const int mode)
{
	//mode = 0 ,Keep the original image size unchanged
	//mode = 1, Change the original image size to fit the rotated scale, padding with zero

	if (src.empty())
	{
		std::cout << "Damn, the input image is empty!\n";
		return -1;
	}

	if (mode == 0)
	{
		cv::Point2f center((src.cols - 1) / 2.0, (src.rows - 1) / 2.0);
		cv::Mat rot = cv::getRotationMatrix2D(center, angle, 1.0);
		cv::warpAffine(src, dst, rot, src.size());//the original size
	}
	else {

		double alpha = -angle * CV_PI / 180.0;//convert angle to radian format 

		cv::Point2f srcP[3];
		cv::Point2f dstP[3];
		srcP[0] = cv::Point2f(0, src.rows);
		srcP[1] = cv::Point2f(src.cols, 0);
		srcP[2] = cv::Point2f(src.cols, src.rows);
		
		//rotate the pixels
		for (int i=0;i<3;i++)
					dstP[i] = cv::Point2f(srcP[i].x*cos(alpha) - srcP[i].y*sin(alpha), srcP[i].y*cos(alpha) + srcP[i].x*sin(alpha));
		double minx, miny, maxx, maxy;
		minx = std::min(std::min(std::min(dstP[0].x, dstP[1].x), dstP[2].x),float(0.0));
		miny  = std::min(std::min(std::min(dstP[0].y, dstP[1].y), dstP[2].y),float(0.0));
		maxx = std::max(std::max(std::max(dstP[0].x, dstP[1].x), dstP[2].x),float(0.0));
		maxy = std::max(std::max(std::max(dstP[0].y, dstP[1].y), dstP[2].y),float(0.0));

		int w = maxx - minx;
		int h = maxy - miny;

		//translation
		for (int i = 0; i < 3; i++)
		{
			if (minx < 0)
				dstP[i].x -= minx;
			if (miny < 0)
				dstP[i].y -= miny;
		}

		cv::Mat warpMat = cv::getAffineTransform(srcP, dstP);
		cv::warpAffine(src, dst, warpMat, cv::Size(w, h));//extend size

	}//end else

	return 0;
}


int spin(const cv::Mat &binary, cv::Mat &spined_img_1, cv::Mat &spined_img_2)
{
    cv::Mat edges;
    vector<cv::Vec2f> lines;//用于储存参数空间的交点
    cv::Canny(binary, edges, 50, 150, 3); //void Canny(image, edges, threshold1, threshold2, apertureSize)
    cv::HoughLines(edges, lines, 1, CV_PI / 180, 0);
    if (lines.size() == 0) 
    {
        //__android_log_print(ANDROID_LOG_DEBUG, "SuperDebug", "%s", "3333333333333333333"); 
        //std::cout << "Error!!!" << std::endl;
        //std::cout << "Hough transform can't get any lines from the picture!" << std::endl;
        return -1;
    }

    float rho = lines[0][0], theta = lines[0][1];
    double cos_theta = cos(theta), sin_theta = sin(theta);
    double x0 = rho * cos_theta, y0 = rho * sin_theta;
    int x1 = static_cast<int>(x0 - 1000 * sin_theta);
    int y1 = static_cast<int>(y0 + 1000 * cos_theta);
    int x2 = static_cast<int>(x0 + 1000 * sin_theta);
    int y2 = static_cast<int>(y0 - 1000 * cos_theta);
    double rotate_radian = atan2(y2 - y1, x2 - x1);
    double rotate_angle = rotate_radian * 180 / PI;
     
    rotateImage(binary, spined_img_1, rotate_angle, 0);
    rotateImage(binary, spined_img_2, rotate_angle + 180, 0);
    return 0;
}



map<string, pair<string, pair<int, int>>> sign_path_map = {
    {"0.jpg", {"0", {42, 62}}}, {"1.jpg", {"%", {68, 63}}},
    {"2.jpg", {"2", {38, 58}}}, {"3.jpg", {"3", {38, 58}}},
    {"4.jpg", {"4", {38, 58}}}, {"5.jpg", {"5", {48, 62}}},
    {"6.jpg", {"6", {38, 58}}}, {"7.jpg", {"7", {33, 58}}}, 
    {"8.jpg", {"#", {42, 60}}}, {"9.jpg", {"9", {43, 62}}},
    {"10.jpg", {"A", {52, 62}}}, {"11.jpg", {"$", {43, 66}}},
    {"12.jpg", {"+", {42, 42}}}, {"13.jpg", {"Z", {52, 62}}},
    {"14.jpg", {"E", {48, 60}}}, {"15.jpg", {"F", {48, 60}}},
    {"16.jpg", {"G", {58, 64}}}, {"17.jpg", {"H", {50, 64}}},
    {"17.jpg", {"H", {43, 54}}}, {"18.jpg", {"J", {35, 54}}}, 
    {"19.jpg", {"K", {46, 54}}}, {"20.jpg", {"L", {42, 62}}},
    {"22.jpg", {"N", {44, 58}}}, 
    {"26.jpg", {"T", {45, 60}}}
};


bool comp_rect(const Rect &a, const Rect &b)
{
	return a.width < b.width && a.height < b.height && a.x < b.x && a.y < b.y;
}

vector<Rect> make_contour(const Mat &mdimg, const Mat &mdimg_tem, int w, int h, double Match_threshold) {
    vector<Rect> rects;
    Mat res;
    cv::matchTemplate(mdimg, mdimg_tem, res, cv::TM_CCOEFF_NORMED);
    Mat mask = res >= Match_threshold;
    vector<vector<Point>> contours;
    findContours(mask, contours, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);
    for (const auto& contour : contours) {
        Rect rect = boundingRect(contour);
        rect.width = w;
        rect.height = h;
        rects.push_back(rect);
    }
    size_t length = rects.size();
    int threshold = 30;
    for (size_t i = 0; i < length; i++) {
        for (size_t j = 0; j < length; j++) {
            if (j != i) {
                if (abs(rects[j].x - rects[i].x) <= threshold &&
                    abs(rects[j].y - rects[i].y) <= threshold) {
                    rects[j] = rects[i];
                }
            }
        }
    }

    sort(rects.begin(), rects.end(), comp_rect);
	rects.erase(unique(rects.begin(), rects.end()), rects.end());

    return rects;
}


string combine_lines(vector<pair<Rect, string>> all_found_contours) {
    vector<vector<pair<Point, string>>> lines;
    lines.resize(3);

    vector<pair<Point, string>> pos_and_label;
    for (auto contours : all_found_contours) {
        int pos_x = contours.first.x + contours.first.width/2;
        int pos_y = contours.first.y + contours.first.height/2;
        pos_and_label.push_back(make_pair(Point(pos_x, pos_y), contours.second));
    }
    int line_0_y = (*min_element(pos_and_label.begin(), pos_and_label.end(),
                                  [](const pair<Point, string>& a, const pair<Point, string>& b) {
                                      return a.first.y < b.first.y; })).first.y;
    int line_1_y = (*max_element(pos_and_label.begin(), pos_and_label.end(),
                                  [](const pair<Point, string>& a, const pair<Point, string>& b) {
                                      return a.first.y < b.first.y; })).first.y;

    for (auto item : pos_and_label) {
        int d1 = abs(item.first.y - line_0_y);
        int d2 = abs(item.first.y - line_1_y);
        if (d1 == std::min({d1, d2})) {
            lines[0].push_back(item);
        }
        if (d2 == std::min({d1, d2})) {
            lines[1].push_back(item);
        }

    }

	string output;
    for (auto& line : lines) {
        sort(line.begin(), line.end(),
             [](const pair<Point, string>& a, const pair<Point, string>& b) {
                 return a.first.x < b.first.x;
             });
        for (auto item : line) {
            output += item.second;
        }
    }

	return output;
}

void draw_contour(Mat img, vector<pair<Rect, string>> all_found_coutours) {
    all_found_coutours.clear();
    all_found_coutours.push_back(std::make_pair(Rect(64, 75, 42, 58), "delta"));
    for (auto found_coutour : all_found_coutours) {
        Rect coutour = found_coutour.first;  // 只取坐标
        cv::rectangle(img, Point(coutour.x, coutour.y), Point(coutour.x + coutour.width, coutour.y + coutour.height),
                             cv::Scalar(0, 255, 0), 1);
    }
    cv::imwrite("../img/output/coutour.png", img);
}


string combine(const Mat &spined_img) {
	string sign_dir = "../img/signs/";

    Mat spined = spined_img;
	Mat thresh1;
	Mat mdimg;

    cv::resize(spined, spined, cv::Size(300, 300));
    cv::threshold(spined, thresh1, 230, 255, cv::THRESH_BINARY);
    cv::medianBlur(thresh1, mdimg, 5);

	draw_contour(spined, vector<pair<Rect, string>>()); //需要注释掉！！！！！！！！！！！！

    vector<pair<cv::Rect, string>> all_found_coutours;

    for (auto sign_path : sign_path_map) {
        Mat template_img = cv::imread(sign_dir + sign_path.first, 0);
		Mat thresh2;
		Mat mdimg_tem;

        cv::resize(template_img, template_img, cv::Size(sign_path.second.second.first, sign_path.second.second.second));
        cv::threshold(template_img, thresh2, 200, 255, cv::THRESH_BINARY);
        cv::medianBlur(thresh2, mdimg_tem, 5);

        int w = template_img.cols, h = template_img.rows;
        double Match_threshold = 0.75;
        auto contours = make_contour(mdimg, mdimg_tem, w, h, Match_threshold);
        if (contours.size() > 0) {
			// cout << sign_path.second.first << endl;
            for (auto contour : contours) {
                all_found_coutours.push_back({ contour, sign_path.second.first });
            }
        }
	}

    if (all_found_coutours.size() == 0) {
        return string();
    }
    return combine_lines(all_found_coutours);
}


map<string, int> str2int_map = {
    {"0", 0}, {"%", 1}, {"2", 2}, {"3", 3},
    {"4", 4}, {"5", 5}, {"6", 6}, {"7", 7},
    {"#", 8}, {"9", 9}, {"A", 10}, {"$", 11},
    {"+", 12}, {"Z", 13}, {"E", 14}, {"F", 15},
    {"G", 16}, {"H", 17}, {"J", 18}, {"K", 19},
    {"L", 20}, {"M", 21}, {"N", 22}, {"P", 23},
    {"=", 24}, {"R", 25}, {"T", 26}, {"U", 27},
    {">", 28}, {"W", 29}, {"X", 30}, {"Y", 31}
};

vector<int> str2array(string output) {
    vector<int> a;
    for (auto i = 0; i < 8; i++) {
        a.push_back(-1);
    }

    int idx = 0;
    for (int i=0; i<output.size(); i++) {
        string cur(1, output[i]);
        a[idx] = str2int_map[cur];
        idx++;
    }
    return a;
}

//z_code
string DecIntToHexStr(int num)
{
	string str;
	if(num==-1)
		return string("GG");
	int Temp = num / 16;
	int left = num % 16;
	if (Temp < 10)
		str += (Temp + '0');
	else if (Temp >= 10)
		str += ('A' + Temp - 10);
	if (left < 10)
		str += (left + '0');
	else
		str += ('A' + left - 10);
	return str;
}

string round_0(double num)
{
	return DecIntToHexStr(int(round(num * 10)));
}

//w_code

Point2d calculate_XYZ(double u, double v) {
    Mat uv_1 = (Mat_<double>(3, 1) << u, v, 1);
    Mat suv_1 = scalingfactor * uv_1;
    Mat xyz_c = inverse_newcam_mtx * suv_1;
    xyz_c = xyz_c - tvec1;
    Mat XYZ = inverse_R_mtx * xyz_c;
    Point2d point_xyz = { Point2d(XYZ.at<double>(0, 0), XYZ.at<double>(1, 0)) };
    return point_xyz;
}

vector<Vec3f> circle_help(Mat img) {
    Mat hsv;
    cvtColor(img, hsv, COLOR_BGR2HSV);
    Scalar lower_white = Scalar(0, 0, 221);
    Scalar higher_white = Scalar(180, 150, 255);
    Mat mask;
    inRange(hsv, lower_white, higher_white, mask);
    Mat white;
    bitwise_and(img, img, white, mask = mask);
    Mat gray;
    cvtColor(white, gray, COLOR_BGR2GRAY);
    Mat gray_blurred;
    blur(gray, gray_blurred, Size(3, 3));
    vector<Vec3f> detected_circles;
    HoughCircles(gray_blurred, detected_circles, HOUGH_GRADIENT, 1, 100, 50, 30, 20, 100);
    return detected_circles;

}

vector<MyData> circle_detector(string path_left, string path_right, string tool_path) {
    Mat img_left = imread(path_left, 1);
    Mat img_right = imread(path_right, 1);

    vector<Vec3f> circles_left;
    vector<Vec3f> circles_right;
    circles_left = circle_help(img_left);
    circles_right = circle_help(img_right);

    //vector<pair<int, Point2d>> record;
    vector<MyData> result;
    std::set<string> record;
 

    if (!circles_right.empty()) {
        for (size_t i = 0; i < circles_right.size(); i++) {
            int a = cvRound(circles_right[i][0]);
            int b = cvRound(circles_right[i][1]);
            int r = cvRound(circles_right[i][2]);
            Rect roi(int(a - r / 2) - 20, int(b - r / 2) - 20, r + 40, r + 40);
            Mat cropped = img_right(roi);

            /////////检测到的字符
            //string cur_string = "KKKKKKKK";

            //cv::Mat title = cv::imread("/data/local/tmp/utils/11.jpg");
            //cur_string = cap2str(title, tool_path);//ceshi
             
            string cur_string = cap2str(cropped, tool_path);
            if (cur_string.size() == 0){
                continue;
            }
            else{
                __android_log_print(ANDROID_LOG_DEBUG, "pringCap", "%s", cur_string.c_str());
            }
            record.insert(cur_string);
            /////////
            Point2d real_xy = calculate_XYZ(b,a);
            MyData cur_circle;
            cur_circle.num = i;
            cur_circle.myPoint = real_xy;
            cur_circle.myString = cur_string;
            /*cur_char.copy(cur_circle.myString, sizeof(cur_circle.myString));*/

            result.push_back(cur_circle);
        }
    }

    if (!circles_left.empty()) {
        for (size_t i = 0; i < circles_left.size(); i++) {
            int a = cvRound(circles_left[i][0]);
            int b = cvRound(circles_left[i][1]);
            int r = cvRound(circles_left[i][2]);
            Rect roi(int(a - r / 2) - 30, int(b - r / 2) - 30, r + 60, r + 60);
            Mat cropped = img_left(roi);

            /////////检测到的字符
            
            //cv::Mat title = cv::imread("/data/local/tmp/debug_v7/utils/11.jpg");
            // string cur_string = cap2str(title);//ceshi
            string cur_string = cap2str(cropped, tool_path);
            //cur_string = "KKKKKKKK";
            if (cur_string.size() == 0){    
            	//__android_log_print(ANDROID_LOG_DEBUG, "SuperDebug", "%s", "未检测出！");
                continue;
            }
            else{
                __android_log_print(ANDROID_LOG_DEBUG, "pringCap", "%s", cur_string.c_str());
            } 
            //string cur_string = cap2str(cropped);

            //string cur_string = cap2str(title);
            std::set<string>::iterator it;
            it = record.find(cur_string);
            ///
            if (it == record.end()) {
                Point2d real_xy = calculate_XYZ(b, a);
                real_xy.x = real_xy.x + 9;
                MyData cur_circle;
                cur_circle.num = record.size();
                cur_circle.myPoint = real_xy;
                cur_circle.myString = cur_string;
                record.insert(cur_string);
                result.push_back(cur_circle);       
            }
        }

    }
    return result;
}
