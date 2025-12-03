//Bailey
class Shield {
// Member Variables
int x, y, w, speed;
char type;
//Adeline
PImage shield;


// Member Methods

Shield() {
   x = int(random(50, width - 50));
    y = int(random(50, height - 100));
    w=40;
   
      shield=loadImage("shield.png");
      shield.resize(w, w);

    }
  

  //Member Methods
  void display() {
    //temporary until images
    imageMode(CENTER);
    image(shield, x, y);
  }




  boolean intersect(Player s) {
    float d = dist(x, y, s.x, s.y);
    return d < (w / 2 + 20);
    }

}
