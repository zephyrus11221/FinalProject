import damkjer.ocd.*;

float x,y,z,g,rotate;

boolean qDown=false;
boolean eDown=false;
boolean dDown=false;
boolean aDown=false;
boolean wDown=false;
boolean sDown=false;
boolean spaceDown=false;

Camera camera1;


void setup() {
  size(1280, 720, P3D);
  camera1 = new Camera(this,
      0, -300, 500, 
      0,-200,0
      
       );
}



void draw() {
  background(0);
       camera1.feed();
  float rotx = (mouseY/100.0);
  float roty = (mouseX/100.0);
  float rotz = 0*PI/36;
// camera(mouseX+x, mouseY+y, (height/2) / tan(PI/6), x+width/2, y+  height/2, z, 0, 1, 0);
  
  translate(-width-x, -height-y,-1000-z);
  strokeWeight(4);
//  rotateY(rotate);
 Arena arena=new Arena();
 arena.display();
 if(aDown==true&&x>-width+50){ 
   x-=8;
 }
 if(dDown==true&&x<width-50){
   x+=8;
 }
 if(qDown==true){ 
   camera1.circle(PI/100);
 }
 if(eDown==true){
   camera1.circle(-PI/100);
 }
 if(wDown==true&&z>-1000+50){
   z-=8;
 }
 if(sDown==true&&z<1000-50){
   z+=8;
 }
 if(spaceDown==true&&y<=0){
   y-=10;
   g+=.2;
 }
 if(y<0){
   y+=g;
 }
 //rotateY(-rotate);
  translate(width+x,height-25+y,1000+z);
  
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
  if(key=='a'){
    aDown=true;
  }
  if(key=='q'){
    qDown=true;
  }
  if(key=='e'){
    eDown=true;
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
void mousePressed(){
  Bullet bullet=new Bullet();
  bullet.display();
}
void keyReleased(){
  if(key=='q'){
    qDown=false;   
  }
  if(key=='e'){
    eDown=false;
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
  if(key=='q'){
    qDown=false;
  }
  if(key=='e'){
    eDown=false;
  }
}


/*void mouseWheel(MouseEvent e) {
  z+=e.getCount()*10;
}*/