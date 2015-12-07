

module switch_land(color){

	body_color = "DarkSlateGray";

	color(body_color)cube([20,10,10]);
	color(body_color)translate([-2,-2,10])	cube([24,14,2]);

	color(color)translate([5,1,6])rotate([0,-20,0])cube([15,8,5]);
//	translate([8,10,20])rotate([90,0,0])cylinder(10,10,10);
	
}