#Dockerfile for python-opencv

# Pull base image.

FROM jsurf/rpi-raspbian:latest
RUN [ "cross-build-start" ]
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    pkg-config \
    libswscale-dev \
    python3-dev \
    python3-numpy \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev \
    libavformat-dev \
    libjpeg62 \
    libtiff4 \
    libjasper1 \
    libilmbase6 \
    libopenexr6 \
    libgtk2.0-0 \
    libdc1394-22 \
    libv4l-0 && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN cv_version='3.1.0' \
    && wget https://github.com/Itseez/opencv/archive/"$cv_version".zip \
    && unzip "$cv_version".zip \
    && mkdir /opencv-"$cv_version"/cmake_binary \
    && cd /opencv-"$cv_version"/cmake_binary \
    && cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_gpu=OFF -DBUILD_opencv_ocl=OFF
    && make install \
    && rm /"$cv_version".zip \
    && rm -r /opencv-"$cv_version"

RUN apt-get install python-pip \
    pip install picamera \
    pip install rpio

CMD ["/bin/bash"]
