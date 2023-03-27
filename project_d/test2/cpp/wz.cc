#include <string>
#include <opencv2/opencv.hpp>
#include <iostream>
#include <typeinfo>
#include <vector>
#include <map>
#include "utils.h"
#include <jni.h>
#include "com_champer_imageanalyze_ImageAnalyzeTool.h"
#include <android/log.h>
#include "ocr_db_crnn.h"

using namespace std;
using namespace cv;

int main(){
	vector<MyData> circles = circle_detector("./utils/right.jpg", "./utils/right.jpg");
	string p_result;
	for (MyData item : circles) {
	cout << item.num << " (" << round(item.myPoint.x) << ", " << round(item.myPoint.y) << ")" << item.myString<<endl;
    	p_result += DecIntToHexStr(item.num);
    	p_result += round_0(item.myPoint.x);
    	p_result += round_0(item.myPoint.y);
    	p_result += item.myString;
    }
    cout << p_result << endl;
    return 0;
}
