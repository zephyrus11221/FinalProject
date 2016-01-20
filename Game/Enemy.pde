class Enemy{
  float arenaW,arenaH,arenaL;
  float eX,eY,eZ;
  float targetX,targetY,targetZ;
  float oldTime;
  float x,y,z;
  boolean sight = true;
  Bullet b=new Bullet(0,0,0,1);
float timeOffSet;
  Enemy(float w,float h,float l,float tOS){
     stroke(random(255),random(255),random(255));
    arenaW=w;
     arenaH=h;
     arenaL=l;
     timeOffSet=tOS;
     eX = random(arenaW);
 eY = random(arenaH);
 eZ = random(arenaL);

  }
  void display(float x,float y,float z){
    translate(eX, eY, eZ);
    sphere(50);
    if (sight == true && millis()-oldTime>=4000+timeOffSet){
      oldTime=millis();
      
      targetX=arenaW/2+x+random(200)-100;
      targetY=arenaH+y+random(200)-100;
      targetZ=arenaL/2+z+random(200)-100;
      
      b=new Bullet(targetX-eX,targetY-eY,targetZ-eZ,1);
      
    }
    if(oldTime>0){
    b.display();
    }
    translate(-eX, -eY, -eZ);
    line(eX, eY, eZ,targetX,targetY,targetZ);
  }
  boolean checkCollision(Bullet b){
    stroke(0,255,255);
    translate(b.getBX(),b.getBY(),b.getBZ());
    sphere(10);
    translate(-b.getBX(),-b.getBY(),-b.getBZ());
    if(60>=sqrt((eX-b.getBX())*(eX-b.getBX())+
                 (eY-b.getBY())*(eY-b.getBY())+
                 (eZ-b.getBZ())*(eZ-b.getBZ()))){
            return true;       
    }
    return false;
  }
  Bullet getBullet(){
    return b;
  }
}