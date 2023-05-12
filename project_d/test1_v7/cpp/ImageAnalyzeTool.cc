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
#include "ocr_db_crnn.h"

using namespace std;
using namespace cv;



JNIEXPORT jstring JNICALL Java_com_champer_imageanalyze_ImageAnalyzeTool_analyze(JNIEnv *env, jobject obj, jstring str1, jstring str2) {
    const char *c_str1 = env->GetStringUTFChars(str1, NULL);
    const char *c_str2 = env->GetStringUTFChars(str2, NULL);
    __android_log_print(ANDROID_LOG_DEBUG, "CS", "%s", c_str1);
    __android_log_print(ANDROID_LOG_DEBUG, "CS", "%s", c_str2);
    vector<MyData> circles = circle_detector(c_str1, c_str2);
    string p_result;
    for (MyData item : circles) {
    	 __android_log_print(ANDROID_LOG_DEBUG, "MyAppTag", "%d", item.num);
    	 __android_log_print(ANDROID_LOG_DEBUG, "MyAppTag", "%f", item.myPoint.x);
    	 __android_log_print(ANDROID_LOG_DEBUG, "MyAppTag", "%f", item.myPoint.y);
    	 __android_log_print(ANDROID_LOG_DEBUG, "MyAppTag", "%s", item.myString.c_str());
    	 
    	 
    	 cout << item.num << " (" << round(item.myPoint.x) << ", " << round(item.myPoint.y) << ")" << item.myString<<endl;
    	 p_result += DecIntToHexStr(item.num);
    	 p_result += round_0(item.myPoint.x);
    	 p_result += round_0(item.myPoint.y);
    	 vector<int> arr = str2array(item.myString);
    	 for(int i=0;i<8;i++){
    	 	p_result += DecIntToHexStr(arr[i]);
    	 }
    	 
    	 
    }
    string result = p_result;
    
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
