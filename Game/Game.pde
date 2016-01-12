float x,y,z,g,rotate;

boolean ADown=false;
boolean DDown=false;
boolean dDown=false;
boolean aDown=false;
boolean wDown=false;
boolean sDown=false;
boolean spaceDown=false;
void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(0);
  float rotx = (-mouseY/1440.0)*-2*PI+PI;
  float roty = (-mouseX/1440.0)*2*PI-PI;
  float rotz = 0*PI/36;
//  camera(mouseX+(1-y*y)(1/2), mouseY+(1-x*x)(1/2), (height/2) / tan(PI/6), x+width/2, y+  height/2, z, 0, 1, 0);
  camera(x*10+width/2+sin(PI/180)*50, y*10+height/2+cos(PI/180)*50, (height/2) / tan(PI/6), x+width/2, y+  height/2,  z, 0, 1, 0);
  translate(0, 0,-1000-z);
  strokeWeight(4);
//  rotateY(rotate);
 Arena arena=new Arena();
 arena.display();
 if(ADown==true&&x>-width/2+50){ 
   x-=2;
 }
 if(DDown==true&&x<width/2-50){
   x+=2;
 }
/* if(aDown==true){ 
   rotate-= PI/180;
 }
 if(dDown==true){
   rotate+=PI/180;
 }*/
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
 //rotateY(-rotate);
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
   
}
void keyPressed(){
  if(key=='A'){
    ADown=true;
  }
  if(key=='a'){
    aDown=true;
  }
  if(key=='d'){
    dDown=true;
  }
  if(key=='D'){
    DDown=true;
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
  if(key=='A'){
    ADown=false;
  }
  if(key=='D'){
    DDown=false;
  }
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
