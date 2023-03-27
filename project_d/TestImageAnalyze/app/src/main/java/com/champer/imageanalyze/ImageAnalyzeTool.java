package com.champer.imageanalyze;

import android.os.Environment;

public class ImageAnalyzeTool {
    // 声明native方法
    public native String analyze(String str1, String str2);
    public native int init();
    public native int release();

    // 加载动态链接库
    static {
        System.loadLibrary("imageanalyze");
        System.loadLibrary("paddle_light_api_shared");

    }

    // 测试函数
    public static void main() {
        ImageAnalyzeTool imageanalyzetool = new ImageAnalyzeTool();
        System.out.println(imageanalyzetool.init());
        if (imageanalyzetool.init()>0){
        	System.out.println("chengxuchushihua");
        }
        //String str1 = Environment.getExternalStorageDirectory().getPath()+"/IMG_20221128_162322.jpg";
        String str1 = "/data/local/tmp/debug_v7/utils/left.jpg";
        String str2 = "/data/local/tmp/debug_v7/utils/right.jpg";
        //String str2 = Environment.getExternalStorageDirectory().getPath()+"/IMG_20230316_184144.jpg";
        System.out.println(str1);
        System.out.println(str2);
        String result = imageanalyzetool.analyze(str1, str2);
        System.out.println(result);
        if(imageanalyzetool.release()>0){
        	System.out.println("chengxushifang");
        }
    }
}

