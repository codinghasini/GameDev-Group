//Bailey,Adeline,Kirubashinilakshana|Nov,5|
Player edgar;
int level;
int score;
int ghostsHit = 0;
ArrayList<Ghost> ghosts;
ArrayList<Coin> coins;
ArrayList<Wall> walls;
ArrayList<Spear> spears;



void setup() {
  size(800, 800); 
  background(20);

 
  btnStart    = new Button("Play!", 220, 150, 160, 50);
  btnMenu     = new Button("Play Game", 220, 150, 160, 50);
  btnSettings = new Button("Settings", 220, 220, 160, 50);
  btnBack     = new Button("Back", 20, 20, 100, 40);

  
  level = 1;
  score = 0;
  edgar = new Player();
  
  ghosts = new ArrayList<Ghost>();
  coins = new ArrayList<Coin>();
  walls = new ArrayList<Wall>();
  spears = new ArrayList<Spear>();
  
  for (int i = 0; i < 5; i++) coins.add(new Coin());
  for (int i = 0; i < 3; i++) ghosts.add(new Ghost());

  walls.add(new Wall(100, 100, 600, 20));
  walls.add(new Wall(100, 200, 20, 400));
  walls.add(new Wall(680, 200, 20, 400));
  walls.add(new Wall(200, 580, 500, 20));
  walls.add(new Wall(300, 300, 200, 20));
}





void draw() {
  background(20);
  switch(screen) {

    case 'S': // Start screen
      startScreen();
      btnStart.display();
      break;

    case 'M': // Menu screen
      drawMenu();
      btnMenu.display();
      btnSettings.display();
      break;

    case 'T': // Settings screen
      drawSettings();
      btnBack.display();
      break;

    case 'P': // Play screen
      drawPlay();
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
      coins.add(new Coin());
      }  
  }
 
 
// can edgar move into next location or is it occupied by a wall
// edgar intersection with coins is off
// no ghosts

 
for (int i = ghosts.size() - 1; i >= 0; i--) {
  Ghost g = ghosts.get(i);
  g.display();

 
  if (g.y > height + g.diam/2) {
    ghosts.remove(i);
    ghosts.add(new Ghost());
    continue;
  }

  
  if (edgar.intersect(g)) {
      edgar.health -= 10;
      ghostsHit++;                     
      println("Hit! Health:", edgar.health);
      ghosts.remove(i);         
      ghosts.add(new Ghost());  
  }
}
  }
}


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
  text("Ghosts Hit: " + ghostsHit, 200, height - 10);

  
  text("Health: " + edgar.health, 420, height - 10);
  text("Ammo: " + edgar.spearCount, 620, height - 10);
}
