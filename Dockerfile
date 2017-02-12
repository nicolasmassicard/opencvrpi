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
COPY lib /lib
CMD ["/bin/bash"]
