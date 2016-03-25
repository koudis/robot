include <wheels/omniwheel_4part.scad>

module motor_holder(){

	metal_color = "Gainsboro";

	module motor_holder_holes(){
	
		translate([7,3,-1])cylinder(4,1,1);
		translate([20,3,-1])cylinder(4,1,1);
		translate([20,12,-1])cylinder(4,1,1);
		translate([7,12,-1])cylinder(4,1,1);
	}

	difference(){
	difference(){
		union(){
			union(){
				color(metal_color)cube([25,15,2]);
				color(metal_color)cube([2,15,13]);
			}
			color(metal_color)translate([0,7.5,12]) rotate([0,90,0]) cylinder(2,7.5,7.5);
		}
		translate([-1,7.5,12]) rotate([0,90,0]) cylinder(4,1.5,1.5);
	}
	motor_holder_holes();
	}
}



module motor(){

	metal_color = "DarkSlateGray";
	axis_color = "SeaShell";

	// motor body
	color(metal_color)rotate([0,90,0]) cylinder(15,6,6);
	// wheel axis
	color(axis_color)translate([-10,0,0]) rotate([0,90,0]) cylinder(20,1,1);
}

module encoder(){

	metal_color = "Gray";

	difference(){
	color(metal_color)cylinder(2,6,6);
	translate([0,0,-1]) cylinder(4,4,4);
	}

	color(metal_color)translate([3.5,3.5,0.1]) cylinder(7,0.75,0.75);
	color(metal_color)translate([-3.5,-3.5,0.1]) cylinder(7,0.75,0.75);
	color(metal_color)translate([-3.5,3.5,0.1]) cylinder(7,0.75,0.75);
	color(metal_color)translate([3.5,-3.5,0.1]) cylinder(7,0.75,0.75);
}


module motor_unit(){
	translate([2.5,7.5,12]) motor();
	motor_holder();
	translate([24,7.5,12]) rotate([0,-90,0]) encoder();
	translate([-7,7.5,12]) rotate([0,90,0]) omniwheel_4part();
	translate([-13.5,7.5,12]) rotate([45,0,0]) rotate([0,90,0]) omniwheel_4part();
}

// uncomment to view
//motor_unit();