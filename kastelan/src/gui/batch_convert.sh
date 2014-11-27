#!/bin/bash

convert() {
	i="$1"
	shift

	mkdir -p tmp/$i
	pwd="`pwd`"
	cd tmp/$i
	"${pwd}/gui_image" "$@" < "${pwd}/$i" > gui_image.log
	"${pwd}/convert_to_video.sh"

	cd "$pwd"
	j=`echo "$i" | tr "/" "_"`
	# Copy jump-images
	mkdir -p out/$j
	tail -n+2 tmp/${i}/gui_image.log | cat -n | grep 'speed.*[0-9][0-9][0-9][0-9]' | sed 's/speed.*/- 1 + 10000000000/' | while read line; do expr $line;done | sed 's#^1\(.*\)#cp tmp/'${i}'/image-\1.png out/'$j'/#' | sh

	cp tmp/${i}/image-final.png out/${j}/ # Copy final image
	cp tmp/${i}/out.avi out/${j}.avi
	cp tmp/${i}/gui_image.log out/${j}.log
}

# Generate list:
# list="`find logs/g1/ logs/final/ -type f`"

listR="logs/g1/prvni_zapas_polaci logs/g1/treti logs/g1/paty logs/final/4_rus logs/final/5_ten_cerny_z_g2 logs/final/6_rakusan"
listB="logs/g1/druhy_zapas_angstrom logs/g1/ctvrty logs/g1/sesty logs/final/1 logs/final/2_rur logs/final/3_jacek logs/final/7_chees"

# Debug:
#listR=""
#listB="logs/final/7_chees"

make gui_image
[ -d tmp ] && rm -rf old_tmp/
[ -d out ] && rm -rf old_out/
[ -d tmp ] && mv tmp old_tmp
[ -d out ] && mv out old_out
mkdir -p out

for i in $listR; do
	convert $i -c R&
done
wait

for i in $listB; do
	convert $i -c B&
done
wait
