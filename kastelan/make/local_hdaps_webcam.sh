#!/bin/sh

# Load config
. ../config

echo Stop me with ^C and after that stop the program on a robot by sending "666 666<Enter>"
cd ../build_x86/
while true; do cat /sys/devices/platform/hdaps/position; sleep 0.1;done | sed 's/,/ /' -u | sed 's/(//' -u | sed 's/)//' -u| nc "$ROBOT_IP" "$ROBOT_PORT" | ./jpeg_webcam_reader
echo Stop me with ^C and after that stop hdaps on a robot by sending "666 666<Enter>"
echo Then kill hdaps_camera on robot
