//Bailey
class Coin {
// Member Variables
int x, y, w, speed;
char type;
PImage coin;


// Member Methods

Coin() {
   x = int(random(50, width - 50));
    y = int(random(50, height - 100));
    w=40;
   
      coin=loadImage("coin.png");
      coin.resize(w, w);

    }
  

  //Member Methods
  void display() {
    //temporary until images
    imageMode(CENTER);
    image(coin, x, y);
  }




  boolean intersect(Player s) {
    float d = dist(x, y, s.x, s.y);
    return d < (w / 2 + 20);
    }
}
