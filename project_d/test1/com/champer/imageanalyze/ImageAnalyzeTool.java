package com.champer.imageanalyze;

public class ImageAnalyzeTool {
    // 声明native方法
    public native String analyze(String str1, String str2);
    public native int init();
    public native int release();

    // 加载动态链接库
    static {
        System.loadLibrary("imageanalyze");
    }

    // 测试函数
    public static void main(String[] args) {
        ImageAnalyzeTool imageanalyzetool = new ImageAnalyzeTool();
        System.out.println(imageanalyzetool.init());
        if (imageanalyzetool.init()>0){
        	System.out.println("chengxuchushihua");
        }
        String str1 = "/home/zjl/java_jni/IMG_20221128_162322.jpg";
        //String str2 = "../image_test/IMG_20221128_162333.jpg";
        String str2 = "/home/zjl/java_jni/IMG_20230316_184144.jpg";
        String result = imageanalyzetool.analyze(str1, str2);
        System.out.println(result);
        if(imageanalyzetool.release()>0){
        	System.out.println("chengxushifang");
        }
    }
}

