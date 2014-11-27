#!/bin/sh

# Load config
. ../config
prepare_build_x86

g++ -lopencv_core -lopencv_highgui -lopencv_imgproc src/test/raw_image_viewer/viewer.cpp -o build_x86/viewer
