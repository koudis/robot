include <../e_components/fuse_holder.scad>
include <../e_components/screw_terminal.scad>
include <../e_components/ceramic_capacitator.scad>

module switchboard_12V(screws){

	s_type = 2;
	screw_hole_points = [[7,7],[7,48],[143,7],[143,48]];

	module screw_holes(s_type){
		for(point = screw_hole_points){
			translate([point[0],point[1],-4])cylinder(4,s_type,s_type);
		}
	}

	module screw(points,nom_len, position){

		s_color = "DarkGrey";
		s_pos = -8;

		// screw head
		for(point = points){
			color(s_color)translate([point[0],point[1],position])cylinder(nom_len,s_type,s_type);
			color(s_color)translate([point[0],point[1],position+nom_len])cylinder(2,s_type+2,s_type+2);
		}
		
	}

	difference(){
	color("ForestGreen")translate([0,0,-3])cube([150,55,2]);
	screw_holes(s_type);
	}

	if(screws){
		screw(screw_hole_points,nom_len=10,position=-10);
	}
	
	translate([70,19.5,0])fuse_holder();
	
	translate([20,3,0])scale([4,4,4])screw_terminal(1,"SteelBlue");
	translate([40,3,0])scale([4,4,4])screw_terminal(1,"SteelBlue");
	
	translate([80,3,0])scale([4,4,4])screw_terminal(1,"SteelBlue");
	translate([100,3,0])scale([4,4,4])screw_terminal(1,"SteelBlue");
	
	translate([35,52.5,0])scale([4,4,4])rotate([0,0,180])screw_terminal(1,"SteelBlue");
	translate([55,52.5,0])scale([4,4,4])rotate([0,0,180])screw_terminal(1,"SteelBlue");
	translate([75,52.5,0])scale([4,4,4])rotate([0,0,180])screw_terminal(1,"SteelBlue");
	translate([95,52.5,0])scale([4,4,4])rotate([0,0,180])screw_terminal(1,"SteelBlue");
	translate([115,52.5,0])scale([4,4,4])rotate([0,0,180])screw_terminal(1,"SteelBlue");

	translate([125,30,10])scale([0.5,0.5,0.5])ceramic_capacitator();
}

//switchboard_12V(screws=true);