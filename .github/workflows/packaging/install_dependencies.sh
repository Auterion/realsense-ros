#!/bin/bash
set -e

apt update \
  && apt install -y \
    git \
    libssl-dev \
    libusb-1.0-0-dev \
    pkg-config \
    libgtk-3-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev

## Build and install Intel RealSense SDK 2.0 v2.45.0 ##
git clone https://github.com/IntelRealSense/librealsense.git -b v2.45.0

PWD=$(pwd)

cd librealsense
cmake -Bbuild -H.
cmake --build build --target install -j`nproc --all`
ldconfig

cd ${PWD}
