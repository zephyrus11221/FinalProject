import damkjer.ocd.*;

float x,y,z,g,rotx,roty,rotz,camDist,runs,oldTime;

float screenX=1280;
float screenY=720;

int oldBullet=0;

int stage;
PImage startscreen;
PFont title;

float arenaW=2*screenX;
float arenaH=screenY;
float arenaL=2000;

float velocity=8;

float rotate=PI/100;

boolean qDown=false;
boolean eDown=false;
boolean dDown=false;
boolean aDown=false;
boolean wDown=false;
boolean sDown=false;
boolean spaceDown=false;
boolean mousePressed=false;
boolean spawnEnemy = true;

Bullet[] bullet=new Bullet[0];


int eNum = 5;
int curEnemy = 0;
Enemy[] enemy=new Enemy[eNum];

Camera camera1;


void setup() {
  size(1280, 720, P3D);
  stage = 1;
  startscreen = loadImage("start.jpg");
  image(startscreen, 0, 0, 1280, 720);
  title = createFont("font", 1000, true);
}

void draw() {
  if (stage==1){
    background(0,0,0);
    image(startscreen,0,0,1280,720);
    textAlign(CENTER);
    fill(0,0,0);
    textSize(36);
    text("BotBlast", 500, 450);
    text("Press Enter/Return to begin", 500, 480);
    if (key==ENTER){
        stage=2;
    }
  }
  if (stage==2){
  background(0);
  fill(255,255,255);
   camera1 = new Camera(this,
      0, -300, 500+camDist, 
      0,-200,0
       );
       camera1.circle(rotate*runs);
       camera1.feed();
  rotx = (mouseY/100.0);
  roty = (mouseX/100.0);
  rotz= 0;
 
  translate(-arenaW/2-x, -arenaH-y,-arenaL/2-z);

  strokeWeight(4);

 Arena arena=new Arena(arenaW,arenaH,arenaL);
 arena.display();
 
 if (curEnemy<eNum){
   for (int x=0; x<enemy.length;x++){
     enemy[x] = new Enemy(arenaW,arenaH,arenaL,-750*eNum/2+750*x);
     curEnemy++;
   }
 }

   for (int a=0; a<enemy.length;a++){
     enemy[a].display(x,y,z);
     for (int y=0; y<bullet.length;y++){
       if(enemy[a].checkCollision(bullet[y])){
         print("a");
         Enemy nEnemy[]=new Enemy[enemy.length-1];
         arrayCopy(enemy,nEnemy,a);
         if(x!=enemy.length-1){
           arrayCopy(enemy,a+1,nEnemy,a,enemy.length-a-1);
         }
         enemy=nEnemy;
         y=bullet.length;
       }
     }
   }
 
 
 if(aDown){ 
   x-=velocity*cos(rotate*runs);
   z+=velocity*sin(rotate*runs);
 }
 if(dDown){
   x+=velocity*cos(rotate*runs);
   z-=velocity*sin(rotate*runs);
 }
 if(qDown){ 
   runs+=1;
 }
 if(eDown){
   runs-=1;
 }
 if(wDown){
   x+=velocity*sin(-rotate*runs);
   z-=velocity*cos(-rotate*runs);
 }
 if(sDown){
   x-=velocity*sin(-rotate*runs);
   z+=velocity*cos(-rotate*runs);
 }
 if(spaceDown&&y<=0){
   y-=10;
   g+=.2;
 }
 if(y<0){
   y+=g;
 }
 //rotateY(-rotate);
 if(mousePressed){
   for (int x=0;x<bullet.length;x++){
   bullet[x].display();
   }
 }
 if(arenaL/2+z>arenaL){
    z=arenaL/2;
  }
  if(arenaL/2+z<0){
    z=-arenaL/2;
  }
  if(arenaW/2+x>arenaW){
    x=arenaW/2;
  }
  if(arenaW/2+x<0){
    x=-arenaW/2;
  }

  translate(arenaW/2+x,arenaH+y,arenaL/2+z);
 if(y>0){
   g=0;
   y=0;
   spaceDown=false;
 }
  rotateY(rotate*runs);
  rotateX(rotx);  
  rotateY(roty);  
  rotateZ(rotz);
  
  Player player=new Player();
  player.display();
  
  }
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
  if(System.nanoTime()-oldTime>=400000000){
    oldTime=System.nanoTime();
    Bullet[] nBullet;
    if(bullet.length<10){
      nBullet=new Bullet[bullet.length+1];
    }
    else{
      nBullet=new Bullet[10];
    }
    for (int x=0;x<bullet.length;x++){
     nBullet[x]=bullet[x];
    }
    nBullet[oldBullet]=new Bullet(x,y,z,rotx,roty,rotz,arenaW,arenaH,arenaL,rotate,runs,spaceDown,aDown,dDown,sDown,wDown,velocity);
    bullet=nBullet;
    if(oldBullet==9){
      oldBullet=0;
    }
    else{
      oldBullet+=1;
    }
    mousePressed=true;
  }
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


void mouseWheel(MouseEvent e) {
  camDist+=e.getCount()*10;
}