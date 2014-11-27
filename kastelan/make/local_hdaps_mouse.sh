#!/bin/sh

# Load config
. ../config

cd ..


service hdapsd stop
rmmod hdaps
cd build_x86
#xinput set-int-prop 12 126 8 0
#xinput set-int-prop 12 124 8 0
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 8 0
./local_uinput_mouse | nc "$ROBOT_IP" "$ROBOT_PORT" & PID=$!
echo MOUSE DISABLED!
echo -n Press Enter to quit...
read continue
kill $PID
#xinput set-int-prop 12 126 8 1
#xinput set-int-prop 12 124 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 8 1
modprobe hdaps
service hdapsd start
echo Stop the program on a robot by sending "666 666<Enter>"
