cmake_minimum_required(VERSION 3.0)
project(wz)


set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(OpenCV_DIR "/home/zjl/opt/opencv/opencv-4.5.4/build")


find_package(OpenCV REQUIRED)
include_directories(
    ${OpenCV_INCLUDE_DIRS}
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set(SOURCES
    wutils.cpp
    wz.cpp 
)

add_executable(wz ${SOURCES})

target_link_libraries(wz
    ${OpenCV_LIBS}
)
