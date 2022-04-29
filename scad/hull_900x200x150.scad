include <../../lib/lib2.scad>

catamaranHullFreeCad();

module catamaranHullFreeCad(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        yCube(30,20,10);
    }//transform
}//module

