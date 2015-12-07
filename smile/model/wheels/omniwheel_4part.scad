
module omniwheel_4part(){

	// Variable definitions
	// Colors
	frame_color = "DarkSlateGray";
	wheel_color = "DarkGray";
	axis_color = "SeaShell";

	//middle cylinder
	difference(){
	color(frame_color)cylinder(5,3,3);
	translate([0,0,-1])cylinder(7,2,2);
	}

	color(frame_color)translate([0,-2,2.5])rotate([90,0,0])scale([3,1,0.8])cylinder(1,3,3);
	color(frame_color)translate([0,2.75,2.5])rotate([90,0,0])scale([3,1,0.8])cylinder(1,3,3);
	
	color(frame_color)translate([2,0,2.5])rotate([90,0,90])scale([3,1,0.8])cylinder(1,3,3);
	color(frame_color)translate([-2.75,0,2.5])rotate([90,0,90])scale([3,1,0.8])cylinder(1,3,3);
	// middle wheels
	color(wheel_color)translate([-7.5,1.5,2.5]) rotate([90,0,0])cylinder(3,3,3); //west
	color(wheel_color)translate([7.5,1.5,2.5]) rotate([90,0,0])cylinder(3,3,3);  //east
	color(wheel_color)translate([-1.5,7.5,2.5]) rotate([90,0,90])cylinder(3,3,3);  //north
	color(wheel_color)translate([-1.5,-7.5,2.5]) rotate([90,0,90])cylinder(3,3,3); //south

	module wheel_end(){
		difference(){
			scale([1,1,1.2]) sphere(3);
			translate([-3,-3,-6]) cube(6);
		}
	}

	// north wheel ends
	color(wheel_color)translate([3,7.5,2.5]) rotate([0,90,0]) wheel_end();
	color(wheel_color)translate([-3,7.5,2.5]) rotate([0,-90,0]) wheel_end();
	// south wheel ends
	color(wheel_color)translate([3,-7.5,2.5]) rotate([0,90,0]) wheel_end();
	color(wheel_color)translate([-3,-7.5,2.5]) rotate([0,-90,0]) wheel_end();
	// west wheel ends
	color(wheel_color)translate([-7.5,3,2.5]) rotate([0,90,90]) wheel_end();
	color(wheel_color)translate([-7.5,-3,2.5]) rotate([0,-90,90]) wheel_end();
	// east wheel ends
	color(wheel_color)translate([7.5,3,2.5]) rotate([0,90,90]) wheel_end();
	color(wheel_color)translate([7.5,-3,2.5]) rotate([0,-90,90]) wheel_end();

	// wheel axis
	// north
	color(axis_color)translate([-3.75,7.5,2.5]) rotate([0,90,0]) cylinder(7.5,0.75,0.75);
	// south
	color(axis_color)translate([-3.75,-7.5,2.5]) rotate([0,90,0]) cylinder(7.5,0.75,0.75);
	// west
	color(axis_color)translate([-7.5,-3.75,2.5]) rotate([0,90,90]) cylinder(7.5,0.75,0.75);
	// east
	color(axis_color)translate([7.5,-3.75,2.5]) rotate([0,90,90]) cylinder(7.5,0.75,0.75);
}