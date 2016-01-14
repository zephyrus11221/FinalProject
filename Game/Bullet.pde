class Bullet{
  float zVelocity=15;
  float runs;
  float g=.2;
  float x,y,z,rotx,roty,rotz;
  Bullet(float playerX,float playerY,float playerZ,float rotateX,float rotateY,float rotateZ){
    x=playerX;
    y=playerY;
    z=playerZ;
    rotx=rotateX;
    roty=rotateY;
    rotz=rotateZ;
  }
  void display(){
    
    if(runs<200){
    translate(width+x,height+y,1000+z);
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
    translate(-(width+x),-(height+y),-(1000+z));
    runs+=1;
    }
  }
}