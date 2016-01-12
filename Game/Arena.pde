class Arena{
  float arenaW,arenaH,arenaL;
  void display(){
     stroke(255,0,0);
     arenaW=2*width;
     arenaH=height;
     arenaL=2000;
    beginShape();
 vertex(0, 0, 0);
 vertex(arenaW,0, 0);
 vertex(arenaW,0, arenaL); 
 vertex(0,0,arenaL);
 endShape();
 beginShape();
 vertex(0, arenaH, 0);
 vertex(arenaW, arenaH, 0);
 vertex(arenaW, arenaH, arenaL);
 vertex(0, arenaH, arenaL);
 endShape();
 beginShape();
 vertex(0, 0, 0);
 vertex(0, arenaH, 0);
 vertex(0, arenaH, arenaL);
 vertex(0, 0, arenaL);
 endShape();
 beginShape();
 vertex(arenaW, 0, 0);
 vertex(arenaW, arenaH, 0);
 vertex(arenaW, arenaH, arenaL);
 vertex(arenaW, 0, arenaL);
 endShape();
 beginShape();
 vertex(0, arenaH, 0);
 vertex(0, 0, 0);
 vertex(arenaW, 0, 0);
 vertex(arenaW, arenaH, 0);

 endShape();
  }
}
