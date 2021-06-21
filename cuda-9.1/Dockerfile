FROM qts8n/cuda-python:9.1-devel
LABEL maintainer="qts8n <efisher9680@gmail.com>"

ARG FAISS_VERSION=v1.7.0
ARG FAISS_EGG=faiss-1.7.0-py3.7.egg
ARG CMAKE_VERSION=3.17
ARG CMAKE_BUILD=1
ARG SWIG_VERSION=3.0.12

ENV BUILD_DIR=/root/temp

# install git for uploading faiss sources & prepare the building directory
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends git software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
    && apt-get update -y \
    && apt-get install -y gcc-6 g++-6 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6 \
    && mkdir "$BUILD_DIR"

# building Cmake
RUN cd "$BUILD_DIR" \
    && apt-get install -y --no-install-recommends libssl-dev \
    && wget "https://cmake.org/files/v$CMAKE_VERSION/cmake-$CMAKE_VERSION.$CMAKE_BUILD.tar.gz" \
    && tar -xzvf "cmake-$CMAKE_VERSION.$CMAKE_BUILD.tar.gz" \
    && cd "cmake-$CMAKE_VERSION.$CMAKE_BUILD" \
    && ./bootstrap \
    && make -j$(nproc) \
    && make install

# building SWIG
RUN cd "$BUILD_DIR" \
    && apt-get install -y --no-install-recommends libopenblas-dev libpcre3-dev \
    && wget "https://downloads.sourceforge.net/swig/swig-$SWIG_VERSION.tar.gz" \
    && tar -xzvf "swig-$SWIG_VERSION.tar.gz" \
    && cd "swig-$SWIG_VERSION" \
    && ./configure --prefix=/usr \
    && make -j$(nproc) \
    && make install

# cleaning temp files
RUN cd ~ \
    && rm -rf "$BUILD_DIR" \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove \
    && apt-get -y clean

RUN pip install --no-cache numpy

# copy script for building faiss
COPY compile_faiss.sh /usr/src/faiss/

RUN cd /usr/src/faiss \
    && /bin/bash compile_faiss.sh

ENV PYTHONPATH="/usr/src/faiss:/usr/src/faiss/faiss"

