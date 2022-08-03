include <../../lib/lib2.scad>

//left
//catamaranHullBoolean4(0,0,0, length=1199/2, section=-1);
//catamaranHullBooleanAtlanticBow(0,0,0, length=1199/2, section=-1);
//right
mirror([0,0,1])
//catamaranHullBoolean4(0,0,0, 180,0,0, length=1129/2, section=3);
catamaranHullBooleanAtlanticBow(0,0,0, length=1199/2, section=-1);
module catamaranHullBooleanAtlanticBow(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=1199, section=0, section_length=150){
    _scale = length/1199;
    echo(_scale);
    translate([px,py,pz])
    rotate([rx,ry,rz])    
        {
        
            scale([_scale, _scale, _scale])
            union(){
                //------- front part
                difference(){
                    scale([2.3,1,1])
                    color("blue")
                    translate([0,100,0])
                    mirror([1,0,0])
                    rotate([0,0,-90])
                    rotate_extrude(angle=90, $fn=100)
                    translate([300,0,0])
                    rotate([0,0,90])
                        import("../svg/04__booleanCatamaranHull/profile_01.svg");
                    //------ cut ---------
                    //top
                    //yTube(400,195,300,  -50,-247.8,50,  7.8,0,0, 5,1,1, $fn=300);       
                    yCyl(195,300,  -50,-247.8,50,  7.8,0,0, 5,1,1, $fn=300);       
                    yCyl(195,300,  -50,121.8,50,  0,0,0, 3,1,1, $fn=300);       
                    yCube(200,200,200,  -600,120,50);
                    yCube(300,100,200,  -150,-50,100);
                    //connection to bottom
                    yCyl(3,50,  -350,-50,30, 90,0,0);
                    yCyl(10,50,  -350,-30,30, 90,0,0);
                    yCyl(3,100,  -450,-50,30, 90,0,0);
                    yCyl(10,50,  -450,-30,30, 90,0,0);
                    //side external      
                    yTube(300,195,200,  0,0,4.7,  -59,0,0, 2.75,1,1, $fn=300);     
                    //cut side internal
                    scale([2.3,1,1])
                    color("red")
                    translate([0,83.2,-24.1])
                    mirror([1,0,0])
                    rotate([0,-16.8,-90])
                    rotate_extrude(angle=90, $fn=100)
                    translate([300,0,0])
                    rotate([0,0,90])
                        import("../svg/04__booleanCatamaranHull/profile_01_cut.svg");
                }//difference                
                
            }//union
        
    }//transform
}//module


module catamaranHullBoolean4(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=1199, section=0, section_length=150){
    _scale = length/1199;
    echo(_scale);
    translate([px,py,pz])
    rotate([rx,ry,rz])    
        {
        difference(){
            scale([_scale, _scale, _scale])
            union(){
                //------- front part
                difference(){
                    scale([2.3,1,1])
                    color("blue")
                    translate([0,100,0])
                    mirror([1,0,0])
                    rotate([0,0,-90])
                    rotate_extrude(angle=90, $fn=100)
                    translate([300,0,0])
                    rotate([0,0,90])
                        import("../svg/04__booleanCatamaranHull/profile_01.svg");
                    //------ cut ---------
                    //top
                    yTube(400,195,300,  -50,-247.8,50,  7.8,0,0, 5,1,1, $fn=300);       
                    //side external      
                    yTube(300,195,200,  0,0,4.7,  -59,0,0, 2.75,1,1, $fn=300);     
                    //cut side internal
                    scale([2.3,1,1])
                    color("red")
                    translate([0,83.2,-24.1])
                    mirror([1,0,0])
                    rotate([0,-16.8,-90])
                    rotate_extrude(angle=90, $fn=100)
                    translate([300,0,0])
                    rotate([0,0,90])
                        import("../svg/04__booleanCatamaranHull/profile_01_cut.svg");
                }//difference
                //------ back part
                translate([0,-193.4,0])
                mirror([0,0,1])
                rotate([0,90,0])           
                linear_extrude(670, scale=0.9)                
                    import("../svg/04__booleanCatamaranHull/profile_01_back.svg");
                //------ connectors   
                chbConnector(0,-47,15, 90,0,0, length=200, height=10);
                chbConnector(400,-56,15, 90,0,0, length=200, height=8);
                chbConnector(650,-60,27.5, 90,90,0, length=55, height=16);
            }//union
            
            _ls = 1199*_scale;        
            _200s = 220*_scale;
            _p0=-529*_scale;
            _puzzle_step=40*_scale;
            if (section>=0){
                translate([(_p0-_ls/2+section_length*section),-_200s/2+1,_200s/2-1]){
            
                difference(){
                    yCube(_ls,_200s,_200s);
                    for (i=[0:_puzzle_step:_200s/3])
                        for (j=[-_200s/3:_puzzle_step:0])
                            yCone(5,3,   _ls/2-1.2,i,j, 0,90,180);
                }//difference
                union(){
                    yCube(_ls,_200s,_200s, _ls+section_length,0,0);
                    for (i=[0:_puzzle_step:_200s/3])
                        for (j=[-_200s/3:_puzzle_step:0])
                            yCone(4.6,2.8,   _ls/2+section_length-1.2,i,j, 0,90,180);
                }//union
                }//translate
             }//if section
        }//difference
    }//transform
}//module

module chbConnector(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=210, width=30, height=5){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            yCube(length,width,height, 0,0,0);
            for(i=[-(length/2):20:(length/2)]){
                yCyl(1,height+10,  i+10,10,0);
                yCyl(1,height+10,  i+10,-10,0);
            }//for
        }//difference
    }//transform
}//module

module catamaranHullBooleanBack(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        rotate([90,0,0])
        rotate([0,90,0])
                //color("blue")
                linear_extrude(600, scale=0.9)
                translate([-100, 0, 0])   
                polygon(points=[[12,0],[7,5],[11,60],[15,63],[42,130],[109.5,160],[126,0]]);
                chbConnector(300,24,15, 90,0,0, length=600, height =8);
    }//transform
}//module

module catamaranHullBooleanFront(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px,py,pz])
    rotate([rx,ry,rz]){
        difference(){
            scale([3,1,1])
            rotate_extrude(angle=90, $fn=300 )
            translate([-200, 0, 0])       
            polygon(points=[[5,0],[0,5],[4,60],[8,63],[20,130],[106,190],[126,0]]);
            
            yTube(300,195,200,  0,0,18,  -55.2,0,0, 2.75,1,1, $fn=300);            
            yTube(400,195,300,  -50,-275,50,  6,0,0, 5,1,1, $fn=300);       
        }//difference
        chbConnector(-100,-76,15, 90,0,0, length=200, height =8);
    }//transform
}//module
