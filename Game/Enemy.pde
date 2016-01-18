class Enemy{
  
  float eX = random(2*width);
  float  eY = random(height);
  float  eZ = random(2000);
  boolean sight = true;
  void display(){
    translate(eX, eY, eZ);
    stroke(255, 0,255);
    sphere(50);
    boolean sight = false;
    if (sight == true){
      line(0,0,0,0,0,sqrt(height*height+4*width*width)+100);
    }
    translate(-eX, -eY, -eZ);
  }
  boolean checkCollision(Bullet b){
    translate(b.getBX(),b.getBY(),b.getBZ());
    stroke(255,255,255);
    sphere(10);
    translate(-b.getBX(),-b.getBY(),-b.getBZ());
    if(60>=sqrt((eX-b.getBX())*(eX-b.getBX())+
                 (eY-b.getBY())*(eY-b.getBY())+
                 (eZ-b.getBZ())*(eY-b.getBZ()))){
            return true;       
    }
    return false;
  }
}