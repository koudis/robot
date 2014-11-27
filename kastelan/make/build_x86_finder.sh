#!/bin/sh

# Load config
. ../config
prepare_build_x86

g++ -I /usr/include/opencv -DARCH_PC -lopencv_core -lopencv_highgui -lopencv_imgproc src/finder/finder.cpp -o build_x86/finder
