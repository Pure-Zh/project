BUILD_DIR=build
rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
cd ${BUILD_DIR}
cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
      -DCMAKE_TOOLCHAIN_FILE=/home/zjl/opt/android_ndk/android-ndk-r25c/build/cmake/android.toolchain.cmake \
      -DANDROID_ABI=arm64-v8a \
      -DANDROID_NATIVE_API_LEVEL=21 \
      -DANDROID_STL=c++_shared \
      ..
      
make -j
