include <../../lib/lib2.scad>

hull_540x100x100();

module hull_540x100x100(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(540,10,10, 270,45,5);
        yCube(540,10,10, 270,-45,5);
        yCube(10,100,10, 535,0,5);
        yCube(10,100,10, 5,0,5);
        translate([0,-50,0])
        rotate([90,0,90])
            import("../stl/test_540x100x100-Loft.stl");
    }//transform
}//module

