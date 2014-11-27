#! /bin/bash
addr="4 0x71"

PATH="/usr/sbin/:$PATH"
while true; do
  i2cset -y $addr 0x00 0x0D #light on
#  i2cset -y $addr 0x00 0x0E #light off

  sleep 0.13
  l=`i2cget -y $addr 0x01 | sed 's/0x//' | tr abcdef ABCDEF`
  h=`i2cget -y $addr 0x02 | sed 's/0x//' | tr abcdef ABCDEF`
  r="$h$l"

  l=`i2cget -y $addr 0x03 | sed 's/0x//' | tr abcdef ABCDEF`
  h=`i2cget -y $addr 0x04 | sed 's/0x//' | tr abcdef ABCDEF`
  w="$h$l"

  l=`i2cget -y $addr 0x05 | sed 's/0x//' | tr abcdef ABCDEF`
  h=`i2cget -y $addr 0x06 | sed 's/0x//' | tr abcdef ABCDEF`
  b="$h$l"

  l=`i2cget -y $addr 0x07 | sed 's/0x//' | tr abcdef ABCDEF`
  h=`i2cget -y $addr 0x08 | sed 's/0x//' | tr abcdef ABCDEF`
  g="$h$l"

  echo "$r $g $b $w" >&2
  r=`echo "obase=16;ibase=16;$r*100/$w+100" | bc`
  g=`echo "obase=16;ibase=16;$g*150/$w+100" | bc`
  b=`echo "obase=16;ibase=16;$b*100/$w+100" | bc`
  r=`echo "$r" | sed -r 's/.*(..)/\1/'`
  g=`echo "$g" | sed -r 's/.*(..)/\1/'`
  b=`echo "$b" | sed -r 's/.*(..)/\1/'`

  echo "#$r $g $b" >&2
  echo "#$r$g$b"
done | ./color.py
