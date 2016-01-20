class Player{
  void display(){
    stroke(0,255,0);
    box(50);
    line(0,0,0,0,0,sqrt(height*height+4*width*width)+100);
  }
  boolean checkCollision(Bullet b,float x, float y,float z){
   if(35>=sqrt((x-b.getBX())*(x-b.getBX())+
                 (y-b.getBY())*(y-b.getBY())+
                 (z-b.getBZ())*(z-b.getBZ()))){
            return true;       
    }
    return false;
  }
}