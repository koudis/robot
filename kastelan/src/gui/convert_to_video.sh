avconv -r 49.666 -i 'image-%010d.png' out.mkv
avconv -i out.mkv -codec copy out.avi
