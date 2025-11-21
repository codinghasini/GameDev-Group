//Bailey
class Ghost {
// Member Variables
int x, y, diam, speed,health;
  PImage ghost;

  //Constructor
  Ghost() {
  x = int(random(100, width - 100));
  y = int(random(50, 200));
  diam = 55;
  speed = int(random(1, 4));
  ghost = loadImage("ghost.png");
}

   
  

  //Member Methods
  void display() {
    imageMode(CENTER);
    image(ghost, x, y,diam,diam);
  }

  
boolean intersect(Ghost g) {
  float d = dist(x, y, g.x, g.y);
  return (d < (diam/2 + g.diam/2));
}

}
