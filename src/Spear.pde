//Adeline | Bailey
class Spear {
// Member Variables
int x, y, w, h, speed, play;
PImage spear;


//Constructor
Spear(int x, int y) {
this.x=x;
this.y=y;
w = 4;
h= 10;
speed=10;
spear = loadImage("spear.png");
spear.resize(70, 70);
}



//Member Methods
void display() {
image(spear, x, y);
}

void move() {
y = y - speed;
}


boolean reachedTop() {
if (y<0-10) {
return true;
} else {
return false;
}
}
}
    
