cmake_minimum_required(VERSION 3.0)
project(imageanalyze)

# 设置C++标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


# 添加头文件路径
#set(CMAKE_PREFIX_PATH "/home/zjl/opt/opencv/opencv-4.5.4:/home/zjl/opt/java11/jdk-11")
set(OpenCV_DIR "/home/zjl/opt/opencv/opencv-4.5.4/lib/cmake/opencv4")

#find_package(Java REQUIRED)
find_package(OpenCV REQUIRED)
include_directories(
    ${OpenCV_INCLUDE_DIRS}
    include
)
include_directories(/home/zjl/opt/java11/jdk-11/include)
include_directories(/home/zjl/opt/java11/jdk-11/include/linux)

# 添加源文件
set(SOURCES
    cpp/ImageAnalyzeTool.cpp
    cpp/utils.cpp
    
)

# 编译为动态库
add_library(imageanalyze SHARED ${SOURCES})

# 链接库
target_link_libraries(imageanalyze
    ${OpenCV_LIBS}
    ${Java_LIBRARIES}
)

