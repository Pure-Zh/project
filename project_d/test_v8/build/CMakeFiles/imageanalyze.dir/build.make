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
CMAKE_SOURCE_DIR = /home/zjl/project/project_d/test_v8

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zjl/project/project_d/test_v8/build

# Include any dependencies generated for this target.
include CMakeFiles/imageanalyze.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/imageanalyze.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/imageanalyze.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/imageanalyze.dir/flags.make

CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o: /home/zjl/project/project_d/test_v8/cpp/ImageAnalyzeTool.cc
CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project/project_d/test_v8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o -MF CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o.d -o CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o -c /home/zjl/project/project_d/test_v8/cpp/ImageAnalyzeTool.cc

CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project/project_d/test_v8/cpp/ImageAnalyzeTool.cc > CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.i

CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project/project_d/test_v8/cpp/ImageAnalyzeTool.cc -o CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.s

CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o: /home/zjl/project/project_d/test_v8/cpp/cls_process.cc
CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project/project_d/test_v8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o -MF CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o.d -o CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o -c /home/zjl/project/project_d/test_v8/cpp/cls_process.cc

CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project/project_d/test_v8/cpp/cls_process.cc > CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.i

CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project/project_d/test_v8/cpp/cls_process.cc -o CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.s

CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o: /home/zjl/project/project_d/test_v8/cpp/crnn_process.cc
CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project/project_d/test_v8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o -MF CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o.d -o CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o -c /home/zjl/project/project_d/test_v8/cpp/crnn_process.cc

CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project/project_d/test_v8/cpp/crnn_process.cc > CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.i

CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project/project_d/test_v8/cpp/crnn_process.cc -o CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.s

CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o: /home/zjl/project/project_d/test_v8/cpp/db_post_process.cc
CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project/project_d/test_v8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o -MF CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o.d -o CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o -c /home/zjl/project/project_d/test_v8/cpp/db_post_process.cc

CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project/project_d/test_v8/cpp/db_post_process.cc > CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.i

CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project/project_d/test_v8/cpp/db_post_process.cc -o CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.s

CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o: /home/zjl/project/project_d/test_v8/cpp/ocr_db_crnn.cc
CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project/project_d/test_v8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o -MF CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o.d -o CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o -c /home/zjl/project/project_d/test_v8/cpp/ocr_db_crnn.cc

CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project/project_d/test_v8/cpp/ocr_db_crnn.cc > CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.i

CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project/project_d/test_v8/cpp/ocr_db_crnn.cc -o CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.s

CMakeFiles/imageanalyze.dir/cpp/utils.cc.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/utils.cc.o: /home/zjl/project/project_d/test_v8/cpp/utils.cc
CMakeFiles/imageanalyze.dir/cpp/utils.cc.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project/project_d/test_v8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/utils.cc.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/utils.cc.o -MF CMakeFiles/imageanalyze.dir/cpp/utils.cc.o.d -o CMakeFiles/imageanalyze.dir/cpp/utils.cc.o -c /home/zjl/project/project_d/test_v8/cpp/utils.cc

CMakeFiles/imageanalyze.dir/cpp/utils.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/utils.cc.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project/project_d/test_v8/cpp/utils.cc > CMakeFiles/imageanalyze.dir/cpp/utils.cc.i

CMakeFiles/imageanalyze.dir/cpp/utils.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/utils.cc.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project/project_d/test_v8/cpp/utils.cc -o CMakeFiles/imageanalyze.dir/cpp/utils.cc.s

CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o: CMakeFiles/imageanalyze.dir/flags.make
CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o: /home/zjl/project/project_d/test_v8/cpp/clipper.cpp
CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o: CMakeFiles/imageanalyze.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zjl/project/project_d/test_v8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o -MF CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o.d -o CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o -c /home/zjl/project/project_d/test_v8/cpp/clipper.cpp

CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.i"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zjl/project/project_d/test_v8/cpp/clipper.cpp > CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.i

CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.s"
	/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zjl/project/project_d/test_v8/cpp/clipper.cpp -o CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.s

# Object files for target imageanalyze
imageanalyze_OBJECTS = \
"CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o" \
"CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o" \
"CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o" \
"CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o" \
"CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o" \
"CMakeFiles/imageanalyze.dir/cpp/utils.cc.o" \
"CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o"

# External object files for target imageanalyze
imageanalyze_EXTERNAL_OBJECTS =

libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/ImageAnalyzeTool.cc.o
libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/cls_process.cc.o
libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/crnn_process.cc.o
libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/db_post_process.cc.o
libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/ocr_db_crnn.cc.o
libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/utils.cc.o
libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/cpp/clipper.cpp.o
libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/build.make
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_calib3d.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_core.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_dnn.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_features2d.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_flann.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_gapi.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_highgui.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_imgcodecs.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_imgproc.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_ml.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_objdetect.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_photo.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_stitching.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_video.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_videoio.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/aarch64-linux-android/21/liblog.so
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/android_ndk/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/aarch64-linux-android/21/libandroid.so
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/libade.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_imgcodecs.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/liblibjpeg-turbo.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/liblibwebp.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/liblibpng.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/liblibtiff.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/liblibopenjp2.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/libIlmImf.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_dnn.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/liblibprotobuf.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/libquirc.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_calib3d.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_features2d.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_flann.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_imgproc.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/staticlibs/arm64-v8a/libopencv_core.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/libtbb.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/libcpufeatures.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/libittnotify.a
libs/arm64-v8a/libimageanalyze.so: /home/zjl/opt/opencv/OpenCV-android-sdk/sdk/native/3rdparty/libs/arm64-v8a/libtegra_hal.a
libs/arm64-v8a/libimageanalyze.so: CMakeFiles/imageanalyze.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zjl/project/project_d/test_v8/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX shared library libs/arm64-v8a/libimageanalyze.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/imageanalyze.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/imageanalyze.dir/build: libs/arm64-v8a/libimageanalyze.so
.PHONY : CMakeFiles/imageanalyze.dir/build

CMakeFiles/imageanalyze.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/imageanalyze.dir/cmake_clean.cmake
.PHONY : CMakeFiles/imageanalyze.dir/clean

CMakeFiles/imageanalyze.dir/depend:
	cd /home/zjl/project/project_d/test_v8/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zjl/project/project_d/test_v8 /home/zjl/project/project_d/test_v8 /home/zjl/project/project_d/test_v8/build /home/zjl/project/project_d/test_v8/build /home/zjl/project/project_d/test_v8/build/CMakeFiles/imageanalyze.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/imageanalyze.dir/depend
