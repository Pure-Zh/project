# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zjl/project_d/test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zjl/project_d/test/build

# Include any dependencies generated for this target.
include CMakeFiles/imageanalyze.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/imageanalyze.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/imageanalyze.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/imageanalyze.dir/flags.make

CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o: /home/zjl/project_d/test/cpp/ImageAnalyzeTool.cpp
CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project_d/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=armv7-none-linux-androideabi21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o -MF CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o.d -o CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o -c /home/zjl/project_d/test/cpp/ImageAnalyzeTool.cpp

CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=armv7-none-linux-androideabi21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project_d/test/cpp/ImageAnalyzeTool.cpp > CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.i

CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=armv7-none-linux-androideabi21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project_d/test/cpp/ImageAnalyzeTool.cpp -o CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.s

CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o: /home/zjl/project_d/test/cpp/utils.cpp
CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project_d/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=armv7-none-linux-androideabi21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o -MF CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o.d -o CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o -c /home/zjl/project_d/test/cpp/utils.cpp

CMakeFiles/imageanalyze.dir/cpp/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/utils.cpp.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=armv7-none-linux-androideabi21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project_d/test/cpp/utils.cpp > CMakeFiles/imageanalyze.dir/cpp/utils.cpp.i

CMakeFiles/imageanalyze.dir/cpp/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/utils.cpp.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=armv7-none-linux-androideabi21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project_d/test/cpp/utils.cpp -o CMakeFiles/imageanalyze.dir/cpp/utils.cpp.s

# Object files for target imageanalyze
imageanalyze_OBJECTS = \
"CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o" \
"CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o"

# External object files for target imageanalyze
imageanalyze_EXTERNAL_OBJECTS =

libs/armeabi-v7a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cpp.o
libs/armeabi-v7a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/utils.cpp.o
libs/armeabi-v7a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/build.make
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_calib3d.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_core.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_dnn.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_features2d.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_flann.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_gapi.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_highgui.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_imgcodecs.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_imgproc.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_ml.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_objdetect.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_photo.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_stitching.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_video.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_videoio.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/arm-linux-androideabi/21/liblog.so
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/arm-linux-androideabi/21/libandroid.so
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/libade.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_imgcodecs.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/liblibjpeg-turbo.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/liblibwebp.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/liblibpng.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/liblibtiff.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/liblibopenjp2.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/libIlmImf.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_dnn.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/liblibprotobuf.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/libquirc.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_calib3d.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_features2d.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_flann.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_imgproc.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/armeabi-v7a/libopencv_core.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/libtbb.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/libcpufeatures.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/libittnotify.a
libs/armeabi-v7a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/armeabi-v7a/libtegra_hal.a
libs/armeabi-v7a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zjl/project_d/test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library libs/armeabi-v7a/libimageanalyze.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/imageanalyze.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/imageanalyze.dir/build: libs/armeabi-v7a/libimageanalyze.so
.PHONY : CMakeFiles/imageanalyze.dir/build

CMakeFiles/imageanalyze.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/imageanalyze.dir/cmake_clean.cmake
.PHONY : CMakeFiles/imageanalyze.dir/clean

CMakeFiles/imageanalyze.dir/depend:
	cd /home/zjl/project_d/test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zjl/project_d/test /home/zjl/project_d/test /home/zjl/project_d/test/build /home/zjl/project_d/test/build /home/zjl/project_d/test/build/CMakeFiles/imageanalyze.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/imageanalyze.dir/depend
