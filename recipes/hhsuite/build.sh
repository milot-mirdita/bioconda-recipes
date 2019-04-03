#!/bin/bash

declare -a CMAKE_PLATFORM_FLAGS
if [[ ${HOST} =~ .*darwin.* ]]; then
  CMAKE_PLATFORM_FLAGS+=(-DCMAKE_OSX_SYSROOT="${CONDA_BUILD_SYSROOT}")
fi

mkdir -p build && cd build
cmake -DCHECK_MPI=0 \
      -DHAVE_MPI=0 \
      -DHAVE_SSE2=1 \
      -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
      -DCMAKE_C_FLAGS=${CFLAGS} \
      -DCMAKE_CXX_FLAGS=${CXXFLAGS} \
      ${CMAKE_PLATFORM_FLAGS[@]} \
      ..

make -j${CPU_COUNT} ${VERBOSE_CM}
make install -j${CPU_COUNT}
make clean
