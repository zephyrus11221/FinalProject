class Bullet{
  float zVelocity=15;
  float runs,velocity;
  float g=.2;
  float x,y,z,rotx,roty,rotz,rotate,runs2;
   float arenaW,arenaH,arenaL;
   boolean dDown,aDown,wDown,sDown,spaceDown;
  Bullet(float playerX,float playerY,float playerZ,float rotateX,float rotateY,float rotateZ,float w,float h,float l,float r,float r2,boolean downSpace,boolean downA,boolean downD,boolean downS,boolean downW,float v){
    x=playerX;
    y=playerY;
    z=playerZ;
    rotx=rotateX;
    roty=rotateY;
    rotz=rotateZ;
    arenaW=w;
     arenaH=h;
     arenaL=l;
     rotate=r;
     runs2=r2;
   dDown=downD;
   aDown=downA;
    wDown=downW;
   sDown=downS;
   velocity=v;
   spaceDown=downSpace;
  }
  void display(){
    
    if(runs<200){
      if(spaceDown){
       y-=10;
     } 
     g+=.2;
     y+=g;
    translate(arenaW/2+x,arenaH+y,arenaL/2+z);
    rotateY(rotate*runs2);
    rotateX(rotx);  
    rotateY(roty);  
    rotateZ(rotz);
    translate(0,y,zVelocity*runs);
    if(aDown){
      translate(-velocity*cos(rotate*runs),0,velocity*sin(rotate*runs));
    }
    if(dDown){
      translate(velocity*cos(rotate*runs),0,-velocity*sin(rotate*runs));
    }
    if(sDown){
      translate(-velocity*sin(rotate*runs),0,velocity*cos(rotate*runs));
    }
    if(wDown){
      translate(velocity*sin(rotate*runs),0,-velocity*cos(rotate*runs));
    }
    stroke(0,0,255);
    sphere(10);
    if(aDown){
      translate(velocity*cos(rotate*runs),0,-velocity*sin(rotate*runs));
    }
    if(dDown){
      translate(-velocity*cos(rotate*runs),0,velocity*sin(rotate*runs));
    }
    if(sDown){
      translate(velocity*sin(rotate*runs),0,-velocity*cos(rotate*runs));
    }
    if(wDown){
      translate(-velocity*sin(rotate*runs),0,velocity*cos(rotate*runs));
    }
    translate(0,-y,-zVelocity*runs);
    rotateZ(-rotz); 
    rotateY(-roty);  
    rotateX(-rotx); 
    rotateY(-rotate*runs2);
    translate(-(arenaW/2+x),-(arenaH+y),-(arenaL/2+z));
    runs+=1;
    }
  }
}