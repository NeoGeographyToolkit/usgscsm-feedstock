#!/bin/sh
set -e

# ASP: do NOT install usgscsm's vendored spdlog (1.3.1) - it would clobber the
# env's conda spdlog 1.16.0 headers (header/lib mismatch -> ABI hazard). Drop
# the include/spdlog entry from USGSCSM_INSTALL_INCLUDE_DIRS; the line becomes
# just the closing paren so the set() stays valid. Consumers use conda spdlog.
sed -i.bak 's@.*include/spdlog")@                                 )@' "$SRC_DIR/CMakeLists.txt"

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
