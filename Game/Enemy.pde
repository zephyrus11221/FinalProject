class Enemy {
  float arenaW, arenaH, arenaL;
  float eX, eY, eZ;
  float targetX, targetY, targetZ;
  float oldTime;
  float x, y, z;
  PShape s;
  boolean sight = true;
  Bullet b=new Bullet(0, 0, 0, 0, 0, 0, 1);
  float timeOffSet;
  Enemy(float w, float h, float l, float tOS,PShape s2) {
    arenaW=w;
    arenaH=h;
    arenaL=l;
    timeOffSet=tOS;
    eX = random(arenaW);
    eY = random(arenaH);
    eZ = random(arenaL);
    s=s2;
  }
  void display(float x, float y, float z) {
    translate(eX, eY, eZ);
    shape(s2,0,0,100,100);
    if (sight == true && millis()-oldTime>timeOffSet) {
      oldTime=millis();

      targetX=arenaW/2+x+random(50)-25;
      targetY=arenaH+y+random(50)-25;
      targetZ=arenaL/2+z+random(50)-25;

      b=new Bullet(targetX-eX, targetY-eY, targetZ-eZ, eX, eY, eZ, 1);
    }
    if (oldTime>0) {
      b.display();
    }
    translate(-eX, -eY, -eZ);
    line(eX, eY, eZ, targetX, targetY, targetZ);
  }
  boolean checkCollision(Bullet b) {
    if (65>sqrt((eX-b.getBX())*(eX-b.getBX())+
      (eY-b.getBY())*(eY-b.getBY())+
      (eZ-b.getBZ())*(eZ-b.getBZ()))) {
      return true;
    }
    return false;
  }
  Bullet getBullet() {
    return b;
  }
}