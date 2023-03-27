#include <iostream>
#include <opencv2/opencv.hpp>
#include "wutils.h"
#include <string>
#include <vector>

using namespace std;
using namespace cv;

int main() {
    vector<pair<int, Point2d>> circles = circle_detector("../IMG_20230316_184144.jpg");
    vector<pair<int, Point2d>> result;
    vector<double> darr;
    string p_result;
    for (auto circle : circles) {
        Point2d real_xy = calculate_XYZ(circle.second.y, circle.second.x);
        p_result += DecIntToHexStr(circle.first);
        p_result += round_0(real_xy.x);
        p_result += round_0(real_xy.y);
        darr.push_back(circle.first);
        darr.push_back(real_xy.x);
        darr.push_back(real_xy.y);
        result.push_back(make_pair(circle.first, real_xy));
    }
    for (pair<int, Point2d> item : result) {
        cout << item.first << " (" << item.second.x << ", " << item.second.y << ")" << endl;
    }
    cout<< p_result <<endl;
}

