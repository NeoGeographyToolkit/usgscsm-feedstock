#!/bin/sh
mkdir build && cd build
cmake ${CMAKE_ARGS}\
  -D CMAKE_BUILD_TYPE=Release\
  -D CMAKE_INSTALL_PREFIX=$PREFIX\
  -D CMAKE_PREFIX_PATH=$PREFIX \
  -D USGSCSM_BUILD_TESTS=OFF\
  -D CMAKE_OSX_DEPLOYMENT_TARGET=10.11\
  -D CMAKE_INSTALL_LIBDIR=lib\
  -D USGSCSM_EXTERNAL_DEPS=OFF\
  -D USGSCSM_BUILD_DOCS=OFF\
  -D ALE_BUILD_DOCS=OFF\
  $SRC_DIR
make -j $CPU_COUNT install
