//Bailey,Adeline,Kirubashinilakshana|Nov,5|
Player edgar;
int level;
int score;
ArrayList<Ghost> ghosts;
ArrayList<Coin> coins;



void setup() {
  size(800, 800);
  background(20);
  ArrayList<Ghost> ghosts;
ArrayList<Coin> coins;
level=1;
score = 0;
  edgar = new Player();
}


void draw() {
  background(20);
  edgar.display();  
 
  infoPanel();
}

void keyPressed() {
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

  fill(40, 0, 40);
  textSize(30);
  textAlign(LEFT);
  text("Score: " + 50, 50, height - 10);
  text("Ghosts Hit " + 250,250, height - 10);
  text("Health: " +  450,450, height - 10);
  text("Ammo: " +  650,650, height - 10);
}
