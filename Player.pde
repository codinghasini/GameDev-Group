class Player {
// Member Variables
int x,y,w,laserCount, turretCount, health;

//Constructor
Player(){
x=width/2;
y=height/2;
w=100;
health=100;
laserCount=100;

}

//Member Methods
void display(){
  rectMode(CENTER);
// Body
  fill(0, 100, 100);
  stroke(0,0,150);
  strokeWeight(3);
  rect(x, y + 40, 30, 80);
 
}

void move(int x,int y) {
this.x = x;
this.y = y;
}

boolean fire(){
if (laserCount>0){
return true;
}else{
  return false;
}
}

boolean intersect(Ghost r) {
  float d= dist(x,y,r.x,r.y);
  if(d<50){
    return true;
  }else{
    return false;
  }
}

boolean intersect(Coin r) {
float d= dist(x,y,r.x,r.y);
  if(d<50){
    return true;
  }else{
    return false;
  }
}


}
