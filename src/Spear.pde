class Spear {
  // Member Variables
  int x, y, frame, frameCount, speed;
  PImage spear;
 

  //Constructor
  Spear(int x, int y) {
    this.x=x;
    this.y=y;
    speed=10;
    frame=0;
    frameCount=2;
    spear = loadImage("spear.png");
   
    }
    
  



  //Member Methods
  void display() {
  }
   

  void move() {
    y=y-speed;
  }


  boolean reachedTop() {
    if (y<0-10) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Ghost r) {
    float d= dist(x, y, r.x, r.y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }
}
