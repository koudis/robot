#! /bin/bash
addr="0 0x71"

remote_one_line(){
  echo "$1"| nc 169.254.0.103 10001 2> /dev/null| while read i; do echo "$i"; kill `ps | grep nc | sed -r 's/^ *([0-9]*).*$/\1/'`; done | tr "\r" "\n" | head -n 1
}

remote_zero_line(){
  echo "$1; echo"| nc 169.254.0.103 10001 2> /dev/null| while read i; do echo "$i"; kill `ps | grep nc | sed -r 's/^ *([0-9]*).*$/\1/'`; done > /dev/null
}


remote_zero_line "i2cset -y $addr 0x0D $1"
