#pragma once
#include<opencv2/opencv.hpp>
#include<iostream>
#include<string>
#include<vector>

using namespace std;
using namespace cv;

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


cv::Mat two_valuing(const std::string &pic_dir, const int thresh);      //用于预处理时图像的二值化

int rotateImage(const cv::Mat &src, cv::Mat &dst, const double angle, const int mode);      //以任意角度旋转图像
void spin(const cv::Mat &binary, cv::Mat &spined_img_1, cv::Mat &spined_img_2);     //矫正图像方向，得到相差180°的两个图像

bool comp_rect(const Rect &a, const Rect &b);       //cv::Rect的自定义比较函数
vector<Rect> make_contour(const Mat &mdimg, const Mat &mdimg_tem, int w, int h, double Match_threshold);        //模板匹配并去重
string combine_lines(vector<pair<Rect, string>> all_found_contours);        //整理各符号位置，最后输出一行
void draw_contour(Mat img, vector<pair<Rect, string>> all_found_coutours);      //在图像上画矩形框
string combine(const string &spined_img_dir);

void str2array(int *a, string output);

string DecIntToHexStr(int num);//将0-255 整数转化为16进制0-FF
string round_0(double num);//将double数据四舍五入并且返回16进制字符串

//wang_code

Point2d calculate_XYZ(double u, double v);
vector<pair<int, Point2d>> circle_detector(string path);
