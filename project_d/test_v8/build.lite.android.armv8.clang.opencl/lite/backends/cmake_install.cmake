# Install script for directory: /Paddle-Lite/lite/backends

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/opencl/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/arm/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/x86/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/cuda/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/fpga/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/host/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/npu/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/xpu/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/mlu/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/bm/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/apu/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/rknpu/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/metal/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/huawei_ascend_npu/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/imagination_nna/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/intel_fpga/cmake_install.cmake")
  include("/Paddle-Lite/build.lite.android.armv8.clang.opencl/lite/backends/nnadapter/cmake_install.cmake")

endif()

