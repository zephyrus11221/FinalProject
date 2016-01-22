class Bullet {
  float zVelocity=15;
  float runs, velocity;
  float g=0;
  float x, y, z, rotx, roty, rotz, rotate, runs2, bX, bY, bZ, old = 0;
  float arenaW, arenaH, arenaL;
  boolean dDown, aDown, wDown, sDown, spaceDown;
  float targetX, targetY, targetZ, bulletType;
  float enemyX, enemyY, enemyZ;
  Bullet(float tX, float tY, float tZ, float eX, float eY, float eZ, int bType) {
    targetX=tX;
    targetY=tY;
    targetZ=tZ;
    bulletType=bType;
    enemyX=eX;
    enemyY=eY;
    enemyZ=eZ;
  }
  Bullet(float playerX, float playerY, float playerZ, 
         float rotateX, float rotateY, float rotateZ, 
         float w, float h, float l, 
         float r, float r2, 
         boolean downSpace, boolean downA, boolean downD, boolean downS, boolean downW, 
         float v) {
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
    bulletType=0;
  }
  void display() {
    if (bulletType==0) {
      old=0;
      bX=0;
      bY=0;
      bZ=0;
      if (runs<200) {
        /*if(spaceDown){
         y-=10;
         } 
         g+=.02;
         y+=g;*/
        bX+=arenaW/2+x;
        bY+=arenaH+y;
        bZ+=arenaL/2+z+zVelocity*runs;
        bZ+=zVelocity*runs;
         
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
        
        translate(bX,bY,bZ);
        stroke(0, 0, 255);
        sphere(10);
        translate(-bX,-bY,-bZ);

        runs+=1;

        if (cos(-rotate*runs2)!=0)
          bY/=cos(-rotate*runs2);


      }
    }
    if (bulletType==1) {
      translate(targetX/50*runs, targetY/50*runs, targetZ/50*runs);
      stroke(255, 0, 255);
      sphere(10);
      translate(-targetX/50*runs, -targetY/50*runs, -targetZ/50*runs);
      bX=targetX/50*runs+enemyX;
      bY=targetY/50*runs+enemyY;
      bZ=targetZ/50*runs+enemyZ;
      runs+=1;
    }
  }
  float getBX() {
    return bX;
  }
  float getBY() {
    return bY;
  }
  float getBZ() {
    return bZ;
  }
}