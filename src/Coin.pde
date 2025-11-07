class Coin {
// Member Variables
int x, y, w, speed;
char type;
PImage coin;


// Member Methods

Coin() {
    x=int (random(width));
    y=-100;
    w=100;
    speed =int(random(1, 5));
   
      coin=loadImage("coin.png");
    }
  

  //Member Methods
  void display() {
    //temporary until images
    imageMode(CENTER);
    imageMode(CENTER);
    coin.resize(100, 100);
    image(coin, x, y);
  }

  void move() {
    y=y+speed;
  }


  boolean reachedBottom() {
    if (y>height+w/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Player s) {
    float d= dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
