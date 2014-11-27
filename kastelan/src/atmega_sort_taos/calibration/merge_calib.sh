bc <<EOF > oba_calib.dat
scale=15
`cat modry_calib.dat cerveny_calib.dat`
print "a=",a/2,"\n"
print "c=",c/2,"\n"
print "d=",d/2,"\n"
print "e=",e/2,"\n"
print "f=",f/2,"\n"
print "h=",h/2,"\n"
EOF