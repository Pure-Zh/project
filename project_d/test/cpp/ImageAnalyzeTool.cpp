//#include <string.h>
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
using namespace std;
using namespace cv;



const int thresh = 210;

JNIEXPORT jstring JNICALL Java_com_champer_imageanalyze_ImageAnalyzeTool_analyze(JNIEnv *env, jobject obj, jstring str1, jstring str2) {
    const char *c_str1 = env->GetStringUTFChars(str1, NULL);
    const char *c_str2 = env->GetStringUTFChars(str2, NULL);
    //const int thresh = 210;
    //Mat imgl = imread(c_str1,IMREAD_COLOR);
    //Mat imgr = imread(c_str2,IMREAD_COLOR);
    //namedWindow("Display windowl",WINDOW_AUTOSIZE);
    //namedWindow("Display windowr",WINDOW_AUTOSIZE);
    //imshow("Display windowl",imgl);
    //imshow("Display windowr",imgr);
    //waitKey(0);
    
    /*------------------------------------------------------*/
    //vector<pair<int, Point2d>> circles = circle_detector("./IMG_20230316_184144.jpg");
    //cout<<typeid(c_str1).name()<<c_str1<<" "<<typeid(c_str2).name()<<c_str2<<endl;
    __android_log_print(ANDROID_LOG_DEBUG, "MyAppTag", "%s", typeid(c_str2).name());
    __android_log_print(ANDROID_LOG_DEBUG, "MyAppTag", "%s", c_str2);
    vector<pair<int, Point2d>> circles = circle_detector(c_str2);
    vector<pair<int, Point2d>> resultv;
    string p_result;
    for (auto circle : circles) {
        Point2d real_xy = calculate_XYZ(circle.second.y, circle.second.x);
        p_result += DecIntToHexStr(circle.first);
        p_result += round_0(real_xy.x);
        p_result += round_0(real_xy.y);
        resultv.push_back(make_pair(circle.first, real_xy));
    }
    for (pair<int, Point2d> item : resultv) {
        cout << item.first << " (" << round(item.second.x) << ", " << round(item.second.y) << ")" << endl;
    }
    /*
    	0 (4, 4)
	1 (8, 2)
	2 (8, 6)
	3 (3, 7)
	4 (8, 6)
	5 (6, 6)
	6 (6, 6)
   */
    cout << p_result << endl;//3E3D
    
    /*------------------------------------------------------*/
    
    /*
    string pic_dir = "./img/unspined/origin3.png";
    
    //Mat imgo = imread(pic_dir,IMREAD_COLOR);
    //namedWindow("Display windowo",WINDOW_AUTOSIZE);
    //imshow("Display windowo",imgo);
    //waitKey(0);
    
    Mat binary = two_valuing(pic_dir, thresh);
    
    //namedWindow("Display windowb",WINDOW_AUTOSIZE);
    //imshow("Display windowb",binary);
    //waitKey(0);
    
    Mat img1, img2;
    spin(binary, img1, img2);
    
    //namedWindow("Display windowl",WINDOW_AUTOSIZE);
    //namedWindow("Display windowr",WINDOW_AUTOSIZE);
    //imshow("Display windowl",img1);
    //imshow("Display windowr",img2);
    //waitKey(0);
    //cv::imwrite("../img/output/spined_1.png", img1);
    //cv::imwrite("../img/output/spined_2.png", img2);
    
    string output1 = combine("./img/output/spined_1.png");
    string output2 = combine("./img/output/spined_2.png");
    string output = output1 > output2 ? output1 : output2;
	
    if (output.size() > 8) {
	cout << "Oops! The num of output string is over 8!" << endl;
	output = string(output.begin(), output.begin() + 8);
	}

    // cout << output << endl;

    int arr[8];
    str2array(arr, output);
    for (int i=0; i<8; i++) {
	cout << arr[i] << " ";//4 3 26 2 0 0 0 0
    }
    cout<<endl;
    string resulta;
    
    //vector<int>v{1,2,3,32,26,25,24,22};
    //int length = v.size();
    
    for(int i=0;i<8;i++){
    	resulta += DecIntToHexStr(arr[i]);
    	}
    string result;
    
    //string result1,result2;
    //double a, b;
    //std::cin >> a >> b;
    //result1 = round_0(a);
    //result2 = round_0(b);
    //result = resulta + result1 + result2;
    
    */
    string result,resulta;
    cout<<resulta<<" "<< p_result << endl;
    result = resulta + p_result;
    
    env->ReleaseStringUTFChars(str1, c_str1);
    env->ReleaseStringUTFChars(str2, c_str2);

    return env->NewStringUTF(result.c_str());
}

JNIEXPORT jint JNICALL Java_com_champer_imageanalyze_ImageAnalyzeTool_init(JNIEnv *env, jobject thiz) {
    //初始化
    return 1;
}

JNIEXPORT jint JNICALL Java_com_champer_imageanalyze_ImageAnalyzeTool_release(JNIEnv *env, jobject thiz) {
    //资源释放
    return 1;
}
