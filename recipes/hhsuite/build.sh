#!/bin/bash


mkdir build
cd build
cmake -DCHECK_MPI=0 -DHAVE_MPI=0 -DCMAKE_INSTALL_PREFIX="${PREFIX}" -DHAVE_SSE2=1 ..
make -j 2
make install
