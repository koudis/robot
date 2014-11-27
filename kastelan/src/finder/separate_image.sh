#!/bin/bash

cat $1 | grep -a -n ...DONE | cut -d : -f 1 > stop
cat $1 | grep -a -n IMAGE | cut -d : -f 1 > start
paste start stop  | while read i j; do cat $1 | head -n $j | tail -n +$i | head -c-9 | tail -c+8 | tee $i; done
