#! /bin/bash

16_10(){
  bc -l <<EOF
  obase=10
  ibase=16
  $1
EOF
}

[[ -f tmp_r.dat ]] && rm tmp_r.dat
[[ -f tmp_g.dat ]] && rm tmp_g.dat
[[ -f tmp_b.dat ]] && rm tmp_b.dat

while read j; do
  read i
  r=`echo "$j" | sed -r 's/(.*) (.*) (.*) (.*)/\1/g'`
  g=`echo "$j" | sed -r 's/(.*) (.*) (.*) (.*)/\2/g'`
  b=`echo "$j" | sed -r 's/(.*) (.*) (.*) (.*)/\3/g'`
  w=`echo "$j" | sed -r 's/(.*) (.*) (.*) (.*)/\4/g'`

  r=`16_10 $r`
  g=`16_10 $g`
  b=`16_10 $b`
  w=`16_10 $w`

  echo $w $r >> tmp_r.dat
  echo $w $g >> tmp_g.dat
  echo $w $b >> tmp_b.dat
done

gnuplot <<EOF 2>&1 | tail -n 6 > output_calib.dat
set terminal pdf
set output "output.pdf"

r(x)=a*x+c
g(x)=d*x+e
b(x)=f*x+h
fit r(x) "tmp_r.dat" via a,c
fit g(x) "tmp_g.dat" via d,e
fit b(x) "tmp_b.dat" via f,h

plot [600:1600] "tmp_r.dat", "tmp_g.dat", "tmp_b.dat", r(x), g(x), b(x)
print "a+=", a
print "c+=", c
print "d+=", d
print "e+=", e
print "f+=", f
print "h+=", h
EOF
