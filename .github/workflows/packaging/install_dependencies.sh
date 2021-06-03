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

## Build and install librealsense2 ##
git clone https://github.com/IntelRealSense/librealsense.git

PWD=$(pwd)

cd librealsense
cmake -Bbuild -H.
cmake --build build --target install -j`nproc --all`
ldconfig

cd ${PWD}
