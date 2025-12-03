//Bailey
class Player {
  // Member Variables
  int  spearCount, turretCount, health;
  float x, h, w, y;
  PImage character;
  //Constructor
  Player() {
    x= width/2;
    y= height/2;
    w= 55;
    h= 55;
    health=100;
    spearCount=100;
    character = loadImage("character1.png");
    character.resize(55,55);
  }

  //Member Methods
  void display() {
    imageMode (CENTER);
    image(character, x, y);
    //character.resize(70,70);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }



  boolean fire() {
    if (spearCount>0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Ghost r) {
    float d= dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Coin r) {
    float d= dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Spider g) {
    float d= dist(x, y, g.x, g.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
