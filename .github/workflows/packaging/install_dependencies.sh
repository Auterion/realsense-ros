#!/bin/bash
set -e

apt update \
  && apt install -y \
    git \
    libssl-dev \
    libusb-1.0-0-dev \
    pkg-config

## Build and install Intel RealSense SDK 2.0 v2.45.0 ##
git clone https://github.com/IntelRealSense/librealsense.git -b v2.45.0

PWD=$(pwd)

cd librealsense
cmake -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_EXAMPLES=false \
  -DBUILD_GRAPHICAL_EXAMPLES=false \
  -DBUILD_TOOLS=false -H.
cmake --build build --target install -j`nproc --all`
ldconfig

cd ${PWD}
