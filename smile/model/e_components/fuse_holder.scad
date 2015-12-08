include <fuse.scad>

module __fuse_hh(){

	difference(){
	difference(){
		difference(){
			difference(){
				cylinder(7,5,5);
				translate([0,0,1])cylinder(7,4,4);
			}
		translate([0,0,-1])cylinder(3,3,3);
		}
		translate([-4.5,2,1.5])cube(9);
	}
	translate([-2,2,-1])cube(4);
}

	translate([-2,-8,0])cube([1,4,7]);
	translate([1,-8,0])cube([1,4,7]);
}

module fuse_holder(){

	translate([2.5,8,16])rotate([0,90,0])fuse();

	difference(){
	color("Seashell")cube([40,16,10]);
	translate([12.5,2,1])cube([15,12,10]);
	}

	color("SlateGray")translate([1,8,16])rotate([90,0,90])__fuse_hh();
	color("SlateGray")translate([39,8,16])rotate([90,0,0])rotate([0,-90,0])__fuse_hh();

	color("SlateGray")translate([4,7,-9])cube([2,2,10]);
	color("SlateGray")translate([34,7,-9])cube([2,2,10]);
}

//fuse_holder();
