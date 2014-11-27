#!/bin/sh

# Load config
. ../config

echo Stop me with ^C and after that stop the program on a robot by sending "666 666<Enter>"
while true; do cat /sys/devices/platform/hdaps/position; sleep 0.1;done | sed 's/,/ /' -u | sed 's/(//' -u | sed 's/)//' -u| nc "$ROBOT_IP" "$ROBOT_PORT"
