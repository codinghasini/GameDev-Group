//Bailey,Adeline,Kirubashinilakshana|Nov,5|
Player edgar;
int level;
int score;
ArrayList<Ghost> ghosts;
ArrayList<Coin> coins;
ArrayList<Wall> walls;




void setup() {
  size(800, 800);
  background(20);
  
  level=1;
  score = 0;
  edgar = new Player();
  
  ghosts = new ArrayList<Ghost>();
  coins = new ArrayList<Coin>();
  walls = new ArrayList<Wall>();
  
  for (int i = 0; i < 5; i++) {
    coins.add(new Coin());
  }
  walls.add(new Wall(100, 100, 600, 20));   // top horizontal wall
  walls.add(new Wall(100, 200, 20, 400));   // left vertical wall
  walls.add(new Wall(680, 200, 20, 400));   // right vertical wall
  walls.add(new Wall(200, 580, 500, 20));   // bottom horizontal wall
  walls.add(new Wall(300, 300, 200, 20));   // middle section

}



void draw() {
  background(20);
  edgar.display();  
 
  infoPanel();

  for (int i = 0; i < walls.size(); i++) {
    walls.get(i).display(); 
  }

  for (int i = coins.size() - 1; i >= 0; i--) {
      Coin c = coins.get(i);
      c.display();
      if (c.intersect(edgar)) {
        score += 10;
        coins.remove(i);
      }
      if (c.intersect(edgar)) {
        score += 10;
        coins.remove(i);
        coins.add(new Coin());
      }  
  }
 
 
// can edgar move into next location or is it occupied by a wall
// edgar intersection with coins is off
// no ghosts

 
  for (int i = ghosts.size() - 1; i >= 0; i--) {
    Ghost g = ghosts.get(i);
    g.move();
    g.display();

    if (g.y > height + g.diam/2) {
     
      ghosts.remove(i);
    }
   
    if (edgar.intersect(g)) {
      edgar.health -= 10; 
    }
  }
}

//boolean edgarWillHitWall(char key){
  
   // float px = edgar.x;
   // float py = edgar.y;
   // float pw = edgar.w;
   // float ph = edgar.h;
   
  
   // if (key == 'w') py -= 10;
   
    //if (key == 's') py += 10;
     
   // if (key == 'a') px -= 10;
  
    //if (key == 'd') px += 10;
  
 // for (int i = 0; i < walls.size(); i++) {
 //   Wall w = walls.get(i);
 //   boolean intersect = rectsOverlap(px, py, pw, ph, w.x, w.y, w.w, w.h);
  //  if (intersect){
  //    return true;
    //}
 // }
 // return false;
//}

//boolean inRange(float x1,float x2, float w2){
 // if (x1 >= x2 && x1 <= (x2+w2)) {
  //  return true;
 // }
 // return false;
//}

//boolean rectsOverlap(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
//    
   // println(x1,y1,h1,w1);
   // println(x2,y2,h2,w2);
    
    //if (inRange(x1, x2, w2)) {
    //  if (inRange(y1, y2, h2)) {
       //  return true;
      //}
    //}
    
    //if (inRange(x2, y1, w1)) {
    //  if (inRange(y2, y1, h1)) {
    //    return true;
    //  }
    //}
    //return false;
  //}

void keyPressed() {
  
  //if (!edgarWillHitWall(key)){
  
    if (key == 'w') edgar.y -= 10;
   
    if (key == 's') edgar.y += 10;
     
    if (key == 'a') edgar.x -= 10;
  
    if (key == 'd') edgar.x += 10;
  }



void startScreen() {
  background(0, 0, 30);
  

  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Echos of the Maze", width / 2, 100);
  textSize(30);
  text("Bailey McKeithen, Adeline Wright,Kirubashinilakshana Senthilnathan", width / 2, 150);
  text("Click to Start", width / 2, 200);
}

void gameOverScreen() {
  background(0);

  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(50);
  text("GAME OVER", width / 2, height - 100);
  textSize(30);
  text("Final Score: " + score, width / 2, height - 50);
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  noStroke();
  rect(width / 2, height - 25, width, 50);

  fill(255);
  textSize(18);
  textAlign(LEFT);
  
  text("Score: " + score, 20, height - 10);
  text("Ghosts Hit: " + ghosts.size(), 200, height - 10);

  
  text("Health: " + edgar.health, 420, height - 10);
  text("Ammo: " + edgar.laserCount, 620, height - 10);
}
