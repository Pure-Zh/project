cmake_minimum_required(VERSION 3.14)
project(imageanalyze)

# 设置C++标准
#set(CMAKE_CXX_STANDARD 11)
#set(CMAKE_CXX_STANDARD_REQUIRED ON)

#设置交叉编译器和工具链
set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_ANDROID_ARCH_ABI armeabi-v7a)
set(CMAKE_ANDROID_NDK /home/zjl/opt/android_ndk/android-ndk-r25c)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fexceptions -frtti -DANDROID_STL=c++_shared -O3 ")
set(CMAKE_ANDROID_TOOLCHAIN_NAME arm-linux-androideabi)

#指定Android API级别
set(CMAKE_ANDROID_API 21)

#设置Android库的版本和类型
set(CMAKE_ANDROID_MIN_SDK_VERSION 16)
set(CMAKE_ANDROID_TARGET_SDK_VERSION 28)
set(CMAKE_ANDROID_VERSION_CODE 1)
set(CMAKE_ANDROID_VERSION_NAME "1.0.0")

#设置输出目录
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs/${CMAKE_ANDROID_ARCH_ABI})


# 添加头文件路径
#set(CMAKE_PREFIX_PATH "/home/zjl/opt/opencv/opencv-4.5.4:/home/zjl/opt/java11/jdk-11")
#set(OpenCV_DIR "/home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/jni")
set(OpenCV_DIR "/home/zjl/opt/opencv/opencv4.1/OpenCV-android-sdk/sdk/native/jni")

#find_package(Java REQUIRED)
find_package(OpenCV REQUIRED)
#使用Android NDK提供的库
find_library(log-lib log)
find_library(android-lib android)
include_directories(
    ${OpenCV_INCLUDE_DIRS}
    ${CMAKE_CURRENT_SOURCE_DIR}
    include
)
include_directories(/home/zjl/opt/java11/jdk-11/include)
include_directories(/home/zjl/opt/java11/jdk-11/include/linux)

# 指定库的路径
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib/armeabi-v7a)

# 添加源文件
#set(SOURCES cpp/*.cc )
file(GLOB SOURCES "cpp/*.cc")
list(APPEND SOURCES "cpp/clipper.cpp")

# 编译为动态库
add_library(imageanalyze SHARED ${SOURCES})
#add_executable(imageanalyze ${SOURCES})

#设置编译选项
target_compile_options(
    imageanalyze
    PRIVATE
    -std=c++11
    -fexceptions
    -frtti
    -O3
#    -Wall
#    -Wextra
#    -Werror
#    -Wno-unused-parameter
#    -Wno-unused-function
#    -Wno-unused-const-variable
#    -Wno-unused-variable
)

# 设置链接选项
target_link_options(
    imageanalyze
    PRIVATE
    -Wl,-soname,libimageanalyze.so
    -Wl,--exclude-libs,libgcc.a
    -Wl,--exclude-libs,libgcc_real.a
    -Wl,--exclude-libs,libatomic.a
    -Wl,--exclude-libs,libunwind.a
    -Wl,--exclude-libs,libcrashhandler.so
)


# 链接库
target_link_libraries(imageanalyze
    ${OpenCV_LIBS}
    ${Java_LIBRARIES}
    ${log-lib}
    ${android-lib}
    paddle_light_api_shared
)

