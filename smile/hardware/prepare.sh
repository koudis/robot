#!/bin/sh 
set -e


_PROJECT="$1"
_OUTPUT_DIR="created"

mkdir -p ${_OUTPUT_DIR}/${_PROJECT}

cp -f ${_PROJECT}/*.cmp ${_OUTPUT_DIR}/${_PROJECT}
cp -f ${_PROJECT}/*.drd ${_OUTPUT_DIR}/${_PROJECT}
cp -f ${_PROJECT}/*.dri ${_OUTPUT_DIR}/${_PROJECT}
cp -f ${_PROJECT}/*.gpi ${_OUTPUT_DIR}/${_PROJECT}
cp -f ${_PROJECT}/*.plc ${_OUTPUT_DIR}/${_PROJECT}
cp -f ${_PROJECT}/*.pls ${_OUTPUT_DIR}/${_PROJECT}
cp -f ${_PROJECT}/*.sol ${_OUTPUT_DIR}/${_PROJECT}
cp -f ${_PROJECT}/*.stc ${_OUTPUT_DIR}/${_PROJECT}
cp -f ${_PROJECT}/*.sts ${_OUTPUT_DIR}/${_PROJECT}


