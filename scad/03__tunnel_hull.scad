include <../../lib/lib2.scad>

tunnel_hull();

module tunnel_hull(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){     
     
     //intersection(){
      /*  scale([2,1,1])
        rotate_extrude(convexity = 10, $fn = 100, angle=90)
        translate([1, 0, 0])          
        import("../svg/03__tunnel_hull/profile_01.svg");
     */
     difference(){
        translate([0,0,0])
        rotate([90,0,90])
        linear_extrude(200)
        import("../svg/03__tunnel_hull/profile_03c.svg");
        translate([0.79,0.98,0.79])
        rotate([90,0,90])
        linear_extrude(202)
        import("../svg/03__tunnel_hull/profile_03s.svg");
        
        yCyl(5,10,  7,7,0);
        yCyl(5,10,  20,7,0);
        yCyl(5,10,  33,7,0);
        }//diff
        
        
     //*
     translate([200,0,0])
        rotate([90,0,90])
        linear_extrude(0.79)
        import("../svg/03__tunnel_hull/profile_03c.svg");   
     //}
    //*/
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