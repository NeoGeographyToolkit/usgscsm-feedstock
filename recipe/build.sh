#!/bin/sh
set -e

# Our no_spdlog fork has spdlog fully removed - no sed hack needed.

mkdir build && cd build
cmake ${CMAKE_ARGS} \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=$PREFIX \
  -D CMAKE_PREFIX_PATH=$PREFIX \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D USGSCSM_EXTERNAL_DEPS=ON \
  -D USGSCSM_BUILD_TESTS=OFF \
  -D USGSCSM_BUILD_DOCS=OFF \
  "$SRC_DIR"
make -j $CPU_COUNT install
