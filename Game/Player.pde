class Player{
  void display(){
    stroke(0,255,0);
    box(50);
    line(0,0,0,0,0,sqrt(height*height+4*width*width)+100);
  }
  boolean checkCollision(Bullet b){
   if(35>=sqrt((b.getBX())*(b.getBX())+
                 (b.getBY())*(b.getBY())+
                 (b.getBZ())*(b.getBZ()))){
            return true;       
    }
    return false;
  }
}