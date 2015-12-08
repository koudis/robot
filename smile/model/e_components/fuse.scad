
module __head(){

	difference(){
	cylinder(8,4,4);
	translate([0,0,0.5])cylinder(8,3,3);
	}
}

module fuse(){

	color("Silver")__head();
	color("Silver")translate([0,0,35])rotate([180,0,0])__head();
	
	%translate([0,0,0.5])cylinder(32,3,3);
	color("Black")translate([0,0,0.5])cylinder(32,1,1);
}

//fuse();