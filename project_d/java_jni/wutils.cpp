#include <iostream>
#include <opencv2/opencv.hpp>
#include "wutils.h"
#include <vector>

using namespace std;
using namespace cv;

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


Point2d calculate_XYZ(double u, double v) {
    Mat uv_1 = (Mat_<double>(3, 1) << u, v, 1);
    Mat suv_1 = scalingfactor * uv_1;
    Mat xyz_c = inverse_newcam_mtx * suv_1;
    xyz_c = xyz_c - tvec1;
    Mat XYZ = inverse_R_mtx * xyz_c;
    Point2d point_xyz = { Point2d(XYZ.at<double>(0, 0), XYZ.at<double>(1, 0)) };
    return point_xyz;
}


vector<pair<int, Point2d>> circle_detector(string path) {
    Mat img = imread(path, 1);
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
    vector<pair<int, Point2d>> record;
    if (!detected_circles.empty()) {
        for (size_t i = 0; i < detected_circles.size(); i++) {
            Point center(cvRound(detected_circles[i][0]), cvRound(detected_circles[i][1]));
            int radius = cvRound(detected_circles[i][2]);
            record.push_back(make_pair(i, center));
        }
    }
    return record;
}

string DecIntToHexStr(int num)
{
	string str;
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

