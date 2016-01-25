class Arena {
  float arenaW, arenaH, arenaL;
  PImage texture;
  Arena(float w, float h, float l,PImage tex) {
    arenaW=w;
    arenaH=h;
    arenaL=l;
    texture=tex;
  }
  void display() {
    beginShape();
    texture(texture);
    vertex(0, 0, 0,0,0);
    vertex(arenaW, 0, 0,1,0);
    vertex(arenaW, 0, arenaL,1,1); 
    vertex(0, 0, arenaL,0,1);
    endShape();
    beginShape();
    texture(texture);
    vertex(0, arenaH, 0,0,0);
    vertex(arenaW, arenaH, 0,1,0);
    vertex(arenaW, arenaH, arenaL,1,1); 
    vertex(0, arenaH, arenaL,0,1);
    endShape();
    beginShape();
    texture(texture);
    vertex(0, 0, 0,0,0);
    vertex(0, arenaH, 0,1,0);
    vertex(0, arenaH, arenaL,1,1); 
    vertex(0, 0, arenaL,0,1);
    endShape();
    beginShape();
    texture(texture);
    vertex(arenaW, 0, 0,0,0);
    vertex(arenaW, arenaH, 0,1,0);
    vertex(arenaW, arenaH, arenaL,1,1); 
    vertex(arenaW, 0, arenaL,0,1);
    endShape();
    beginShape();
    texture(texture);
    vertex(0, arenaH, 0,0,0);
    vertex(0, 0, 0,1,0);
    vertex(arenaW, 0, 0,1,1); 
    vertex(arenaW, arenaH, 0,0,1);

    endShape();
  }
}