#! /bin/bash
addr="4 0x71"

PATH="/usr/sbin/:$PATH"
while true; do
  i2cset -y $addr 0x00 0x0D #light on
#  i2cset -y $addr 0x00 0x0E #light off
  sleep 0.13
  l=`i2cget -y $addr 0x01 | sed 's/0x//'`
  h=`i2cget -y $addr 0x02 | sed 's/0x//'`
   r=$h$l
  l=`i2cget -y $addr 0x03 | sed 's/0x//'`
  h=`i2cget -y $addr 0x04 | sed 's/0x//'`
   w=$h$l
  l=`i2cget -y $addr 0x05 | sed 's/0x//'`
  h=`i2cget -y $addr 0x06 | sed 's/0x//'`
   b=$h$l
  l=`i2cget -y $addr 0x07 | sed 's/0x//'`
  h=`i2cget -y $addr 0x08 | sed 's/0x//'`
   g=$h$l
  echo $r $g $b $w
done
