class Bullet{
  float zVelocity=15;
  float runs,velocity;
  float g=0;
  float x,y,z,rotx,roty,rotz,rotate,runs2,bX,bY,bZ,old;
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
  old=0;
  bX=0;
  bY=0;
  bZ=0;
    if(runs<200){
      /*if(spaceDown){
       y-=10;
     } 
     g+=.02;
     y+=g;*/
    translate(arenaW/2+x,arenaH+y,arenaL/2+z);
    rotateY(rotate*runs2);
    rotateX(rotx);  
    rotateY(roty);  
    rotateZ(rotz);
    
    translate(0,0,zVelocity*runs);
    bZ+=zVelocity*runs;
    if(aDown){
      translate(-velocity*cos(rotate*runs),0,velocity*sin(rotate*runs));
      bX+=-velocity*cos(rotate*runs);
    bY+=0;
    bZ+=velocity*sin(rotate*runs);
    }
    if(dDown){
      translate(velocity*cos(rotate*runs),0,-velocity*sin(rotate*runs));
      bX+=velocity*cos(rotate*runs);
    bY+=0;
    bZ+=-velocity*sin(rotate*runs);
    }
    if(sDown){
      translate(-velocity*sin(rotate*runs),0,velocity*cos(rotate*runs));
      bX+=-velocity*sin(rotate*runs);
    bY+=0;
    bZ+=velocity*cos(rotate*runs);
    }
    if(wDown){
      translate(velocity*sin(rotate*runs),0,-velocity*cos(rotate*runs));
      bX+=velocity*sin(rotate*runs);
    bY+=0;
    bZ+=-velocity*cos(rotate*runs);
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
    translate(0,0,-zVelocity*runs);
    rotateZ(-rotz); 
    rotateY(-roty);  
    rotateX(-rotx); 
    rotateY(-rotate*runs2);
    translate(-(arenaW/2+x),-(arenaH+y),-(arenaL/2+z));
    runs+=1;
   
    old+=bX;
    bX=bX*cos(-rotate*runs2)+bZ*sin(-rotate*runs2);
    bZ=-old*sin(-rotate*runs2)+bZ*cos(-rotate*runs2);
    old=0;
    
    old+=bY;
    bY=-bZ*sin(rotx)+bY*cos(rotx);
    bZ=old*sin(rotx)+bZ*cos(rotx);
    old=0;
    
    old+=bX;
    bX=bX*cos(-roty)+bZ*sin(-roty);
    bZ=-old*sin(-roty)+bZ*cos(-roty);
    old=0;
    
    old+=bX;
    bX=-bY*sin(-rotz)+bX*cos(-rotz);
    bY=old*sin(-rotz)+bY*cos(-rotz);
    old=0;
   if(cos(-rotate*runs2)!=0)
    bY/=cos(-rotate*runs2);
    
    bX+=arenaW/2+x;
    bY+=arenaH+y;
    bZ+=arenaL/2+z;
    }
  }
  float getBX(){
    return bX;
  }
  float getBY(){
    return bY;
  }
  float getBZ(){
    return bZ;
  }
}