class Bullet{
  float zVelocity=15;
  float runs;
  float g=.2;
  float x,y,z,rotx,roty,rotz,rotate,runs2;
   float arenaW,arenaH,arenaL;
  Bullet(float playerX,float playerY,float playerZ,float rotateX,float rotateY,float rotateZ,float w,float h,float l,float r,float r2){
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
  }
  void display(){
    
    if(runs<150){
    translate(arenaW/2+x,arenaH+y,arenaL/2+z);
    rotateY(rotate*runs2);
    rotateX(rotx);  
    rotateY(roty);  
    rotateZ(rotz);
    translate(0,-g*runs,zVelocity*runs);
    stroke(0,0,255);
    sphere(10);
   
    translate(0,g*runs,-zVelocity*runs);
    rotateZ(-rotz); 
    rotateY(-roty);  
    rotateX(-rotx); 
    rotateY(-rotate*runs2);
    translate(-(arenaW/2+x),-(arenaH+y),-(arenaL/2+z));
    runs+=1;
    }
  }
}