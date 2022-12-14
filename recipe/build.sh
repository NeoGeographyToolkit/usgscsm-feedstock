#!/bin/sh
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release   \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DUSGSCSM_EXTERNAL_DEPS=ON     \
    -DCMAKE_PREFIX_PATH=$PREFIX    \
    -DBUILD_TESTS=OFF              \
    ..
make install

