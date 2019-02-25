#!/bin/bash

export CC=gcc
export CXX=g++

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="${PREFIX}" -DHAVE_SSE2=1 ..
make -j 2
make install
