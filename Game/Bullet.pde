class Bullet{
  float zVelocity=15;
  float runs;
  float g=.2;
  float x,y,z,rotx,roty,rotz;
   float arenaW,arenaH,arenaL;
  Bullet(float playerX,float playerY,float playerZ,float rotateX,float rotateY,float rotateZ,float w,float h,float l){
    x=playerX;
    y=playerY;
    z=playerZ;
    rotx=rotateX;
    roty=rotateY;
    rotz=rotateZ;
    arenaW=w;
     arenaH=h;
     arenaL=l;
  }
  void display(){
    
    if(runs<150){
    translate(arenaW/2+x,arenaH+y,arenaL/2+z);
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
    translate(-(arenaW/2+x),-(arenaH+y),-(arenaL/2+z));
    runs+=1;
    }
  }
}