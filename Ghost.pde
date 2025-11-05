class Ghost {
// Member Variables
int x, y, diam, speed,health;
  PImage ghost;

  //Constructor
  Ghost() {
    x=50;
    y=50;
    diam=100;
    speed=int(random(1,4));
    
      ghost=loadImage("ghost.png");
  }
  

  //Member Methods
  void display() {
    imageMode(CENTER);
    image(ghost, x, y,diam,diam);
  }

  void move() {
    y=y+speed;
  }
}
