float x,y,z,g;

boolean aDown=false;
boolean dDown=false;
boolean wDown=false;
boolean sDown=false;
boolean spaceDown=false;
void setup() {
  size(640, 360, P3D);
}

void draw() {
  background(0);
  float rotx = (-mouseY/1440.0)*-2*PI+PI;
  float roty = (-mouseX/1440.0)*2*PI-PI;
  float rotz = 0*PI/36;
  //camera(mouseX, mouseY, (height/2) / tan(PI/6)+z, width/2, height/2, 0, 0, 1, 0);
  translate(0, 0,-1000);
  strokeWeight(4);
 
 Arena arena=new Arena();
 arena.display();
 if(aDown==true&&x>-width/2+50){
   x-=2;
 }
 if(dDown==true&&x<width/2-50){
   x+=2;
 }
 if(wDown==true&&z>-1000+50){
   z-=2;
 }
 if(sDown==true&&z<0-50){
   z+=2;
 }
 if(spaceDown==true&&y<=0){
   y-=10;
   g+=.2;
 }
 if(y<0){
   y+=g;
 }
  translate(width/2+x,height-25+y,1000+z);
  
 if(y>0){
   g=0;
   y=0;
   spaceDown=false;
 }
  rotateX(rotx);  
  rotateY(roty);  
  rotateZ(rotz);
  
  Player player=new Player();
  player.display();
  noFill(); 
}
void keyPressed(){
  if(key=='a'){
    aDown=true;
  }
  if(key=='d'){
    dDown=true;
  }
  if(key=='w'){
    wDown=true;
  }
  if(key=='s'){
    sDown=true;
  }
  if(key==' '){
    spaceDown=true;
  }
}
void keyReleased(){
  if(key=='a'){
    aDown=false;
  }
  if(key=='d'){
    dDown=false;
  }
  if(key=='w'){
    wDown=false;
  }
  if(key=='s'){
    sDown=false;
  }
}


/*void mouseWheel(MouseEvent e) {
  z+=e.getCount()*10;
}*/