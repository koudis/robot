#!/bin/sh

cd ..

# Load config
. ../config
prepare_flash

sz -y --tcp-client "$ROBOT_IP:$ROBOT_PORT" build_arm/finder
