#!/bin/sh
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release\
  -D CMAKE_INSTALL_PREFIX=$PREFIX\
  -D CMAKE_PREFIX_PATH=$PREFIX \
  -D BUILD_CSM=OFF\
  -D BUILD_TESTS=OFF\
  -D CMAKE_OSX_DEPLOYMENT_TARGET=10.11\
  -DCMAKE_INSTALL_LIBDIR=lib\
  $SRC_DIR
make -j $CPU_COUNT install
