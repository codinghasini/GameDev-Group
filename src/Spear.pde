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
}
    
