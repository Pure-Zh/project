# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.10/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.10/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Paddle-Lite

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Paddle-Lite/build.lite.android.armv8.clang.opencl

# Utility rule file for fbs_headers.

# Include the progress variables for this target.
include CMakeFiles/fbs_headers.dir/progress.make

CMakeFiles/fbs_headers:
	/opt/cmake-3.10/bin/cmake -E copy_if_different /Paddle-Lite/third-party/flatbuffers/pre-build/framework_generated.h /Paddle-Lite/lite/model_parser/flatbuffers/
	/opt/cmake-3.10/bin/cmake -E copy_if_different /Paddle-Lite/third-party/flatbuffers/pre-build/param_generated.h /Paddle-Lite/lite/model_parser/flatbuffers/
	/opt/cmake-3.10/bin/cmake -E copy_if_different /Paddle-Lite/third-party/flatbuffers/pre-build/cache_generated.h /Paddle-Lite/lite/backends/opencl/utils/
	/opt/cmake-3.10/bin/cmake -E copy_if_different /Paddle-Lite/third-party/flatbuffers/pre-build/tune_cache_generated.h /Paddle-Lite/lite/backends/opencl/utils/

fbs_headers: CMakeFiles/fbs_headers
fbs_headers: CMakeFiles/fbs_headers.dir/build.make

.PHONY : fbs_headers

# Rule to build all files generated by this target.
CMakeFiles/fbs_headers.dir/build: fbs_headers

.PHONY : CMakeFiles/fbs_headers.dir/build

CMakeFiles/fbs_headers.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/fbs_headers.dir/cmake_clean.cmake
.PHONY : CMakeFiles/fbs_headers.dir/clean

CMakeFiles/fbs_headers.dir/depend:
	cd /Paddle-Lite/build.lite.android.armv8.clang.opencl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Paddle-Lite /Paddle-Lite /Paddle-Lite/build.lite.android.armv8.clang.opencl /Paddle-Lite/build.lite.android.armv8.clang.opencl /Paddle-Lite/build.lite.android.armv8.clang.opencl/CMakeFiles/fbs_headers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fbs_headers.dir/depend
