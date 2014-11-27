#!/bin/bash

# change dir to /opencv/
cd `dirname "${BASH_SOURCE[0]}"`
# Load config
. ../config


[ -e opencv-1.1pre1.tar.gz ] || wget 195.140.254.170:8080/opencv-1.1pre1.tar.gz

[ -d opencv-1.1.0 ] && echo OpenCV already installed! && exit 1

tar -xvf opencv-1.1pre1.tar.gz 

cd opencv-1.1.0/
export PATH="$PATH:$BFIN_TOOLCHAIN_PATH"
./configure --host=bfin-uclinux --without-gtk --without-carbon --without-quicktime \
--without-1394libs --without-ffmpeg --without-python --without-swig --enable-static \
--disable-shared --disable-apps CC=bfin-uclinux-gcc CXX=bfin-uclinux-g++ \
CPPFLAGS=-I/opt/uClinux/bfin-uclinux/bfin-uclinux/runtime/usr/include\ \
-I/opt/uClinux/bfin-linux-uclibc/bfin-linux-uclibc/runtime/usr/include
make
cd ..
mkdir include
cp opencv-1.1.0/*/include/*.h include/
cp opencv-1.1.0/*/include/*.hpp include/
cp opencv-1.1.0/otherlibs/highgui/*.h include/

mkdir lib
cp opencv-1.1.0/*/src/*.la lib
cp opencv-1.1.0/*/src/*.lo lib
cp opencv-1.1.0/*/src/*.o lib
cp opencv-1.1.0/*/src/.libs/*.a lib

cp opencv-1.1.0/otherlibs/highgui/*.la lib
cp opencv-1.1.0/otherlibs/highgui/*.lo lib
cp opencv-1.1.0/otherlibs/highgui/*.o lib
cp opencv-1.1.0/otherlibs/highgui/.libs/*.a lib
