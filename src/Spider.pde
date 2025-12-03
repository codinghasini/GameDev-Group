//Bailey
class Spider {
// Member Variables
int x, y, diam, speed,health;
PImage spider;

//Constructor
Spider() {
x = int(random(100, width - 100));
y=int (random(0, height-5-diam/2));
diam = int(random(50, 100));
speed = int(random(1, 4));
spider = loadImage("spider.png");
}




//Member Methods
void display() {
imageMode(CENTER);
image(spider, x, y,diam,diam);
}
void move() {
x=x+speed;
}
boolean reachedBottom() {
if (y>height+diam/2) {
return true;
} else {
return false;
}
}

boolean intersect(Spider g) {
float d = dist(x, y, g.x, g.y);
return (d < (diam/2 + g.diam/2));
}

}
