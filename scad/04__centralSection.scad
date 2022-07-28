include <../../lib/lib2.scad>
include <../../lib/lib2/ext/motor.scad>



catamaranBody(-150,0,0);        

//2print
//engineTurbine(0,0,0, 0,-90,45);
//engineTurbine(-20,10,0, 0,-90,cw=0);
//shaftHolderEngine(0,0,5,    0,10,0);    
//shaftHolderEngineCapBack(ry=-80);
//shaftHolderEngineCapFront(ry=90);
//translate([0,-80,0])    
//import("../stl/tmp/shaftHolderEngine.stl");
//shaftHolderBack(0,0,0, 0,-90,0);
//shaftHolderBack(0,0,0, 0,0,0);
//nameFalke();

module chassisFront(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, cw=1){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        translate([-50,0,-6])
        difference(){
            yCube(100,100,10,  -10,50,0);
            yCube(80,30,50,     -10,50,0);            
            
            for (i=[0:20:50]){
                for (j=[20:20:80]){
                    yCyl(1,20,  i-15,j,-10);
                }//for j
            }//for i            
        }//diff
    }//transform
}//module        

    
module catamaranBody(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //front(engine) holder
        shaftHolderEngineCapFront(64.5,0,0);
        shaftHolderEngineCapBack();
        shaftHolderEngine();        
        shaftHolderBack();
        engineTurbine(145,0,10,  0,-10,0);
        chassisFront(150,0,0);
        
        color("blue")
        translate([-50,50,-60])
        rotate([0,-100,0]){
            yCyl(4.5,250,   0,0,0);
            yCyl(27.5,10,   0,0,140); //prop 40mm
            yCyl(6,35,   0,0,-140); //prop 40mm
            yCyl(16,32,   0,0,-160); //engine 2212 (14RxL28)
            }//translate
    }//transform
}//module        

module engineTurbine(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0, cw=1){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        translate([-65,50,-36]){
            angle=(cw>0)?45:-45;
            difference(){
                union(){
                    yCyl(5,3, ry=90);            
                    for(i=[0:90:350]){
                        rotate([i,0,0])
                        yCube(0.8,12,7,    0,9,0, 0,angle,-12);
                    }//for
                }//union
                yCyl(1.70,10,  ry=90);
                yCyl(5,3, px=3,ry=90); 
                yCyl(17,3, px=-3,ry=90); 
            }//difference
            
        }//translate
    }//transform
}//module   

module nameFalke(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        linear_extrude(1.2)
        text(
            text = "Falke", 
            size = 15,             
            valign = "center", 
            halign = "center",
            $fn = 50
            );
        yCube(44,1, 1.2, -1.5,-7.,0.6);
    }//transform
}//module        

module shaftHolderEngineCapBack(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){        
        difference(){
            yCube(7,29.4,27,   53.5,50,-24, 0,-10,0);  
            yCube(20,30,20,   53,50,-48, 0,-00,0);  
            yCube(7,20,30, 56,50,-18);
            yCyl(4.8,250,   -50,50,-60,  0,-100,0);
            yCyl(1.6,40,  56,60,-25);  
            yCyl(1.6,40,  56,40,-25);  
            yCyl(4.2,30,  56,60,-18);  
            yCyl(4.2,30,  56,40,-18);  
        }//difference        
        
    }//transform
}//module        

module shaftHolderEngineCapFront(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        scale([0.5,1,1])
        difference(){
            yMinkCubeSphere(40,43,68,10,   117,50,-15.6, 0,0);
            yCube(100,100,100, 79,50,-20); 
            yCube(100,100,40, 95,50,9);          
            
            //holes
            yCyl(1.7,20,  130,31.5,-20, 0,90,0);
            yCyl(1.7,20,  130,31.5,-40, 0,90,0);
            yCyl(1.7,20,  130,68.5,-20, 0,90,0);
            yCyl(1.7,20,  130,68.5,-40, 0,90,0);
            //engine
            yCyl(15,10, 130,50,-28,    0,90,0);  
        }//difference        
    }//transform
}//module        
    
module shaftHolderEngine(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
            difference(){
                union(){
                yMinkCubeSphere(90,42,68,10,   95,50,-21, 0,-10);
                //yMinkCubeSphere(40,30,60,10,   60,50,-20, 0,-10);
                yCube(60,65,8, 100,50,-13.5, 0,-10,0);              
                //support for top connector
                yCyl(14.6,1, 128.5,30,-19.5, 0,90,0, $fn=3);
                yCyl(14.6,1, 100.5,30,-24.5, 0,80,0, $fn=3);
                yCyl(14.6,1, 72.5,30,-29.5, 0,80,0, $fn=3);
        
                yCyl(14.6,1, 128.5,70,-19.5, 0,90,0, $fn=3, clr="blue");
                yCyl(14.6,1, 100.5,70,-24.5, 0,80,0, $fn=3);
                yCyl(14.6,1, 72.5,70,-29.5, 0,80,0, $fn=3);
                }//union
            yCube(74,34,60,   95,50,-22,   0,-10,0);                
            yCyl(4.8,250,   -50,50,-60,  0,-100,0);
            yCube(50,9.6,50,   50,50,-15);  
            yCube(50,30,40,   50,50,-18);  
            yCyl(1,20,  56,60,-35);  
            yCyl(1,20,  56,40,-35);  
            
            yCube(100,100,40, 95,50,9);            
            yCube(20,100,100,   139,50,0);
        
            //connector top
            yCyl(2,20, 85,80,-15,   0,10,0);
            yCyl(2,20, 105,80,-10,   0,10,0);
            yCyl(2,20, 125,80,-10,   0,10,0, clr="red");    
            yCyl(2,20, 85,20,-15,   0,10,0);
            yCyl(2,20, 105,20,-10,   0,10,0);
            yCyl(2,20, 125,20,-15,   0,10,0, clr="red");    
            //front cover
            yCyl(1,20,  130,31.5,-20, 0,90,0);
            yCyl(1,20,  130,31.5,-40, 0,90,0);
            yCyl(1,20,  130,68.5,-20, 0,90,0);
            yCyl(1,20,  130,68.5,-40, 0,90,0);
        }//diff
            
        difference(){
            union(){
                translate([157,50,-23])
                rotate([45,-10,0])          
                scale([2,1,1])          
                blMotor2212_bot(0,0,0,  0,90,0, mirror=1);
                yCube(8,10,30, 128,37,-31.5, 0,-10,0, clr="green");
                yCube(8,10,30, 128,63,-31.5, 0,-10,0, clr="green");
                }//union
            yCube(20,100,100,   139,50,0);
            }//diff
        //supprot for engine mount
        yCube(3.0,20,10, 127.6,50,-42.5);
    }//transform
}//module            
module shaftHolderBack(px=0,py=0,pz=0, rx=0,ry=0,rz=0, mx=0,my=0,mz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz])
    mirror([mx,my,mz]){
        //back holder    
        difference(){
            union(){
                yMinkCubeSphere(14,16,16,6,   -160,50,-79, 0,-10,0, sx=1.5);
                yMinkCubeCyl(5,5,76,2,   -160,35,-43, 16,0,0, sx=3.6);
                yMinkCubeCyl(5,5,76,2,   -160,65,-43, -16,0,0, sx=3.6);
                yCube(30,16,5, -155,20,-8);
                yCube(30,16,5, -155,80,-8);
                
                //safety ring
                difference(){
                    yTube(36.2,35,10, -163.3,50,-86,  0,90,0);
                    yCube(11,26,10,  -163.3,50,-50,);
                    }//diff
                yCyl(1.5,36,  -163.4,50,-104,    0,0,0,  4);
                yCyl(1.5,34,  -163.4,67,-95,    45,0,0,  4);
                yCyl(1.5,34,  -163.4,34,-95,    -45,0,0,  4);
            }//union
            yCyl(4.8,250,   -50,50,-60,  0,-100,0);            
            yCube(10,110,210,   -173,50,-50);
            
            yCyl(2,20,    -165, 20,-10);
            yCyl(2,20,    -145, 20,-10);
            yCyl(2,20,    -165, 80,-10);
            yCyl(2,20,    -145, 80,-10);
            
            yCyl(1.4,10, -160,50,-75);
        }//diff
        
    }//transform
}//module        