#!/bin/sh

# Load config
. ../config
prepare_build_arm

bfin-uclinux-gcc -I src/common/jpeg/ -O2 src/test/raw_image_reader/v4l_test.c src/common/jpeg/jpeg.c -x assembler-with-cpp src/common/jpeg/r8x8dct.asm -o build_arm/raw_image_reader
