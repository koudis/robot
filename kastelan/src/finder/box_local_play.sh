./finder | sed -u 's/Total Contours.*/BOX: x=0 y=0 w=0 h=0 c=3/' | grep "^BOX" --line-buffered | ./box_view&
