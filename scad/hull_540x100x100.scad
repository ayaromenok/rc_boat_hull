include <../../lib/lib2.scad>

hull_540x100x100();
engine(185,0,-50, 0,87,0);
module hull_540x100x100(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
/*                yCube(540,10,10, 270,45,5);
                yCube(540,10,10, 270,-45,5);
                yCube(10,100,10, 535,0,5);
                yCube(10,100,10, 5,0,5);                          
*/                
            translate([0,-50,0])
            rotate([90,0,90])
                    import("../stl/test_540x100x100-Loft.stl");            
                
            translate([0,-50,0])
            rotate([90,0,90])
                    import("../stl/test_540x100x100-120_240.stl");
            translate([0,-50,0])
            rotate([90,0,90])
                    import("../stl/test_540x100x100-240_360.stl");                                
            translate([0,-50,0])
            rotate([90,0,90])
                    import("../stl/test_540x100x100-360_540.stl");                        
    }//transform
}//module

module bulkheads(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        translate([0,-50,-60])
        rotate([90,0,90])
        linear_extrude(1.19)
            import("../svg/540x100x100/000_closed.svg");                
        
        translate([120,-50,-60])
        rotate([90,0,90])
        linear_extrude(1.19)
            import("../svg/540x100x100/120_closed.svg");            
        translate([240,-50,-60])
        rotate([90,0,90])
        linear_extrude(1.19)
            import("../svg/540x100x100/240_closed.svg");            
        translate([360,-50,-56.5])
        rotate([90,0,90])
        linear_extrude(1.19)
            import("../svg/540x100x100/360_closed.svg");                
    }//transform
}//module
    
module engine(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCyl(4.5,250,   0,0,0,  0,0,0);
        yCyl(25,10, 0,0,-150,  0,0,0);
        yCyl(14,25, -10,0,160,    0,-30,0);
    }//transform
}//module

module engine_cut(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCyl(4.9,250,   0,0,0,  0,0,0);
        //yCyl(25,10, 0,0,-150,  0,0,0);
        //yCyl(14,25, -10,0,160,    0,-30,0);
    }//transform
}//module