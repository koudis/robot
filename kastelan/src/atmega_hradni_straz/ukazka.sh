#! /bin/bash

/usr/sbin/i2cset -y 2 0x77 0x0C 0x44 0x20 0x4C 0x40 0x44 0x10 0x47 0x10 0x4B 0x20 0x4B 0x20 0x4C 0x20 0x49 0x40 0x49 0x20 0x44 0x40 0x40 0x10 0x44 0x10 i
while (( `/usr/sbin/i2cget -y 2 0x77` != 0x00 )); do true; done
/usr/sbin/i2cset -y 2 0x77 0x0D 0x47 0x20 0x47 0x20 0x4B 0x20 0x49 0x20 0x49 0x20 0x45 0x20 0x44 0x40 0x45 0x20 0x47 0x40 0x44 0x10 0x44 0x10 0x4C 0x40 0x54 0x20 i
while (( `/usr/sbin/i2cget -y 2 0x77` != 0x00 )); do true; done
/usr/sbin/i2cset -y 2 0x77 0x0F 0x4B 0x20 0x4B 0x20 0x4C 0x20 0x49 0x40 0x4B 0x20 0x44 0x40 0x4C 0x20 0x49 0x20 0x49 0x20 0x4C 0x20 0x54 0x40 0x48 0x20 0x4B 0x40 0x4C 0x20 0x49 0x40 i
while (( `/usr/sbin/i2cget -y 2 0x77` != 0x00 )); do true; done
