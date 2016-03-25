
module __connector(){

	translate([5,2,-4])cube([1,6,6]);
	translate([9,2,-4])cube([1,6,6]);
	translate([13,2,-4])cube([1,6,6]);
}

module switch_land(color){

	s_length = 20;
	s_width = 10;
	s_height = 10;

	body_color = "DarkSlateGray";

	color(body_color)cube([s_length,s_width,s_height]);
	color(body_color)translate([-2,-2,10])	cube([s_length+4,s_width+4,2]);

	color(color)translate([5,1,6])rotate([0,-20,0])cube([15,8,5]);
//	translate([8,10,20])rotate([90,0,0])cylinder(10,10,10);

 	difference(){
		color("Silver")__connector();
	translate([0,s_width/2,-2])rotate([0,90,0])cylinder(s_length,1,1);
	}
	
}

//switch_land("Green");