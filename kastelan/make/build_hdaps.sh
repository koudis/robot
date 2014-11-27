#!/bin/sh

# Load config
. ../config
prepare_build_arm

bfin-uclinux-g++ src/test/hdaps/hdaps.cpp -o build_arm/hdaps

cd make
prepare_build_x86

cc src/test/hdaps/local_uinput_mouse.c -o build_x86/local_uinput_mouse
