class Arena{
  void display(){
     stroke(255,0,0);
    beginShape();
 vertex(0, 0, 0);
 vertex(width,0, 0);
 vertex(width,0, 1000); 
 vertex(0,0,1000);
 endShape();
 beginShape();
 vertex(0, height, 0);
 vertex(width, height, 0);
 vertex(width, height, 1000);
 vertex(0, height, 1000);
 endShape();
 beginShape();
 vertex(0, 0, 0);
 vertex(0, height, 0);
 vertex(0, height, 1000);
 vertex(0, 0, 1000);
 endShape();
 beginShape();
 vertex(width, 0, 0);
 vertex(width, height, 0);
 vertex(width, height, 1000);
 vertex(width, 0, 1000);
 endShape();
 beginShape();
 vertex(0, height, 1000);
 vertex(0, 0, 1000);
 vertex(width, 0, 1000);
 vertex(width, height, 1000);

 endShape();
  }
}