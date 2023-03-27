public class MyJNI {
    // 声明native方法
    public native String concatStrings(String str1, String str2);

    // 加载动态链接库
    static {
        System.loadLibrary("myjni");
    }

    // 测试函数
    public static void main(String[] args) {
        MyJNI myjni = new MyJNI();
        String str1 = "../image_test/IMG_20221128_162322.jpg";
        //String str2 = "../image_test/IMG_20221128_162333.jpg";
        String str2 = "./IMG_20230316_184144.jpg";
        String result = myjni.concatStrings(str1, str2);
        System.out.println(result);
    }
}

