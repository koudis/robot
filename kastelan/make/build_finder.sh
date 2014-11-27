#!/bin/sh

# Load config
. ../config
prepare_build_arm

bfin-uclinux-g++ -I opencv/include/ src/finder/finder.cpp \
opencv/lib/cxarray.o \
opencv/lib/cxerror.o \
opencv/lib/cxalloc.o \
opencv/lib/cxcopy.o \
opencv/lib/cxconvert.o \
opencv/lib/cxlut.o \
opencv/lib/cxdatastructs.o \
opencv/lib/cxtables.o \
opencv/lib/cvcontours.o \
opencv/lib/cvthresh.o \
opencv/lib/cvapprox.o \
opencv/lib/cvutils.o \
opencv/lib/cvhistogram.o \
opencv/lib/cxcmp.o \
opencv/lib/cxlogic.o \
opencv/lib/cxarithm.o \
opencv/lib/cxsumpixels.o \
opencv/lib/cxminmaxloc.o \
opencv/lib/cxpersistence.o \
opencv/lib/cvshapedescr.o \
opencv/lib/cxsvd.o \
opencv/lib/cvgeometry.o \
opencv/lib/cxmatmul.o \
opencv/lib/cxmathfuncs.o \
opencv/lib/cxjacobieigens.o \
opencv/lib/cxmatrix.o \
opencv/lib/cxutils.o \
opencv/lib/cxnorm.o \
opencv/lib/cxrand.o \
-lpthread -o build_arm/finder

#opencv/lib/cvtables.o opencv/lib/cvcolor.o opencv/lib/libcxcore.a \
