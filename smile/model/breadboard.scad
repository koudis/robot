

module __breadboard_body(){

	b_color = "AntiqueWhite";

	difference(){
		color(b_color)cube([67.5,50,5]);
		translate([-2,24,3])cube([74,2,5]);
	}
}

module __pin_holes_bottom(){

	row = 5;
	row_count = 30;
	step = 2;
	count = 5;

	start = 12;
	for(x = [row:step:(row+((row_count-1)*step))]){
		for(y = [start:step:(start+((count-1)*step))]){
			translate([x,y,3,])cube([1,1,5]);
		}
	}
}

module __pin_holes_top(){

	row = 5;
	row_count = 30;
	step = 2;
	count = 5;

	start = 28;
	for(x = [row:step:(row+((row_count-1)*step))]){
		for(y = [start:step:(start+((count-1)*step))]){
			translate([x,y,3,])cube([1,1,5]);
		}
	}
}

module __power_holes_bottom(){

	row = 5;
	row_count = 30;
	step = 2;
	count = 2;

	start = 5;
	for(x = [row:step:(row+((row_count-1)*step))]){
		for(y = [start:step:(start+((count-1)*step))]){
			translate([x,y,3,])cube([1,1,5]);
		}
	}
}

module __power_holes_top(){

	row = 5;
	row_count = 30;
	step = 2;
	count = 2;

	start = 41;
	for(x = [row:step:(row+((row_count-1)*step))]){
		for(y = [start:step:(start+((count-1)*step))]){
			translate([x,y,3,])cube([1,1,5]);
		}
	}
}

module __holes(){
	
	__pin_holes_top();
	__pin_holes_bottom();
	__power_holes_bottom();
	__power_holes_top();
}

module __labels(){

	color("Red")translate([5,3.5,3.1])cube([59,1,2]);
	color("Blue")translate([5,8.5,3.1])cube([59,1,2]);

	color("Red")translate([5,39.5,3.1])cube([59,1,2]);
	color("Blue")translate([5,44.5,3.1])cube([59,1,2]);
}

module breadboard(){

	difference(){
	__breadboard_body(a,b);
	__holes();
	}
	__labels();
}
