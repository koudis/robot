#! /bin/bash

while read j; do
  read i
  echo "$j" >&2
  echo $i | sed 's/ //g'
  sleep 0.13
done | ./color.py
