include <../../lib/lib2.scad>

hull_900x200x150();

module hull_900x200x150(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(900,10,10, 450,95,5);
        yCube(900,10,10, 450,-95,5);
        yCube(10,200,10, 895,0,5);
        yCube(10,200,10, 5,0,5);
        translate([0,-100,0])
        rotate([90,0,90])
        import("../stl/test_900x200x150-Loft.stl");
    }//transform
}//module

