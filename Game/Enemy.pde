class Enemy{
  void display(){
    float eX, eY, eZ;
    eX = random(2*width);
    eY = random(height);
    eZ = random(2000);
    translate(eX, eY, eZ);
    stroke(255, 0, 255);
    sphere(50);
    boolean sight = true;
    if (sight == true){
      line(0,0,0,0,0,sqrt(height*height+4*width*width)+100);
    }
    translate(eX, eY, eZ);
  }
}