#pragma once
#include<opencv2/opencv.hpp>
#include<iostream>
#include<string>
#include<vector>


using namespace std;
using namespace cv;

Point2d calculate_XYZ(double u, double v);
vector<pair<int, Point2d>> circle_detector(string path);
string DecIntToHexStr(int num);//将0-255 整数转化为16进制0-FF
string round_0(double num);//将double数据四舍五入并且返回16进制字符串
