//Bailey,Adeline,Kirubashinilakshana|Nov,5|
Player edgar;
char screen = 's';
//game over, a = app stats
//Kirubashinilakshana Bailey
Button btnStart, btnMenu, btnSettings, btnBack;
int score;
int ghostsHit = 0;
ArrayList<Ghost> ghosts;
ArrayList<Coin> coins;
ArrayList<Wall> walls;
ArrayList<Spear> spears;
ArrayList<Spider> spiders;
Timer spidertimer;
//Kirubashinilakshana
PImage start;
PImage menu;
//Adeline
PImage end;
boolean play;
boolean instructions;
int level = 1;
float timeLeft = 10;
//Sound for when spear shoots
SoundFile wsound;
import processing.sound.*;



void setup() {
  size(1200, 700);
  background(20);
  rectMode(CENTER);
//Kirubashinilakshana
  menu = loadImage("menu.png");
  start = loadImage("start.png");
//Adeline
  end = loadImage("EndPage.png");
  level=1;
  score = 0;
  edgar = new Player();
//Adeline
wsound = new SoundFile(this, "woosh.mp3");
//Bailey
  spidertimer = new Timer(5000);
  spidertimer.start();


  //Kirubashinilakshana Bailey
  btnStart = new Button("Start", 390, 315, 395, 140);
  btnMenu = new Button("How to Play", 390, 508, 395, 140);
  btnBack = new Button("Back", 20, 20, 200, 80);

  ghosts = new ArrayList<Ghost>();
  coins = new ArrayList<Coin>();
  walls = new ArrayList<Wall>();
  spears= new ArrayList <Spear>();
  spiders= new ArrayList <Spider>();

  for (int i = 0; i < 5; i++) {
    coins.add(new Coin());
  }
  for (int i = 0; i < 3; i++) {
    ghosts.add(new Ghost());
  }
 


  walls.add(new Wall(390, 50, 600, 20)); // top horizontal wall
  walls.add(new Wall(100, 350, 20, 400)); // left vertical wall
  // walls.add(new Wall(100, 500, 20, 400)); // continued left vertical wall
  walls.add(new Wall(680, 250, 20, 400)); // right vertical wall
  // walls.add(new Wall(680, 500, 20, 400)); //continued right vertical wall
  // walls.add(new Wall(390, 700, 600, 20)); // bottom horizontal wall
  walls.add(new Wall(390, 300, 300, 20)); // middle section
}



void draw() {
  if (instructions) {
    instructionScreen();
    return;
  }

  if (!play) {
    startScreen();
    return;
  }


  background(20);
  infoPanel();
  edgar.display();

  timeLeft = timeLeft -1.0/60;
  if (timeLeft <= 0) {
    level = level +1;
    score += 100;
    timeLeft = 20;
    spiders.clear();
    int spiderCount = (level + 1) / 2;
    
      for (int i = 0; i < spiderCount; i++) {
    spiders.add(new Spider());
  }
  }
      else if (edgar.health <= 0) {
    gameOverScreen();
    return;
  }
  



  //edgar.x = constrain(edgar.x, edgar.w, width  - edgar.w);
  // edgar.y = constrain(edgar.y, edgar.w, height - edgar.w);




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
      ghosts.remove(i);
      ghosts.add(new Ghost());
    }
  }
   
    for (int i = spiders.size() - 1; i >= 0; i--) {
  Spider g = spiders.get(i);
  g.display();
  g.move();


    if (g.y > height + g.diam/2) {
  spiders.remove(i);
  spiders.add(new Spider());
    continue;
}
  if (edgar.intersect(g)) {
    edgar.health -= 50;
    score -= 50;
    spiders.remove(i);
    spiders.add(new Spider());
    }
  }
//Adeline - spear
 for (int i = spears.size() - 1; i >= 0; i--) {
  Spear s = spears.get(i);
  s.move();
  s.display();

  
  if (s.reachedTop()) {
    spears.remove(i);
    continue;
  }

  
  for (int g = ghosts.size() - 1; g >= 0; g--) {
    Ghost ghost = ghosts.get(g);

    if (dist(s.x, s.y, ghost.x, ghost.y) < ghost.diam / 2) {
      score += 10;
      ghosts.remove(g);
      ghosts.add(new Ghost());
      spears.remove(i);
      continue;   
    }
  }
//Bailey
  for (int sp = spiders.size() - 1; sp >= 0; sp--) {
    Spider spider = spiders.get(sp);

    if (dist(s.x, s.y, spider.x, spider.y) < spider.diam / 2) {

      score += 50;
      spiders.remove(sp);
      spiders.add(new Spider());

      spears.remove(i);
      continue;   
      }
    }
  }
}



void keyPressed() {
  
  // Saves previous player position before moving,
  //and will restore values if player hits the wall
  float prevX = edgar.x;
  float prevY = edgar.y;
  if (key == 'w' || keyCode == UP)    edgar.y -= 10;
  if (key == 's' || keyCode == DOWN)  edgar.y += 10;
  if (key == 'a' || keyCode == LEFT)  edgar.x -= 10;
  if (key == 'd' || keyCode == RIGHT) edgar.x += 10;

  // COLLISION FOR ALL WALLS
  for (Wall w : walls) { // After movement, check all walls to see if edgar intersected it
    if (w.intersects(edgar)) { //IF the collision does happen
      // undo the movement (stop) so that player does not go through wall
      edgar.x = prevX;
      edgar.y = prevY;

      // stop checking other walls once collision is detected
      break;
    }
  }
}


//if (key == 'w') edgar.y -= 10;

//if (key == 's') edgar.y += 10;

// if (key == 'a') edgar.x -= 10;

//if (key == 'd') edgar.x += 10;

// else if (keyCode == DOWN) {
//   edgar.y+=10;
// } else if (keyCode == LEFT) {
//edgar.x-=10;
// } else if (keyCode == RIGHT) {
// edgar.x+=10;
// } else if (keyCode == UP) {
// edgar.y-=10;

//for (Wall w : walls) {
//  if (w.intersects(edgar)) {
//   edgar.x = prevX;
//  edgar.y = prevY;
// break;
//}
//}
// }
//}

void mousePressed() {

  if (! play && !instructions) {

    if (!play && btnStart.clicked()) {
      play = true;       // start the game
    }

    if ( btnMenu.clicked()) {
      instructions = true; // show menu screen
      return;
    }
  }

  if (instructions) {

    if (btnBack.clicked()) {
      instructions = false;
      return;
      
    }
  }
  if (play) {
    spears.add(new Spear((int)edgar.x, (int)edgar.y));
wsound.play();
}

}

void instructionScreen() {
  background(0);
  imageMode(CENTER);
  image(menu, width/2, height/2);

  btnBack.display();
  fill(255);
  textAlign(CENTER);
  textSize(30);
}


//Kirubashinilakshana
void startScreen() {
  background(0);
  imageMode(CENTER);
  image(start, width/2, height/2);


  btnStart.display();
  btnMenu.display();

  fill(255);
  textAlign(CENTER);
  textSize(40);
}
//Bailey (code)
//Adeline (art)
void gameOverScreen() {
  background(0);
  imageMode(CENTER);
  image(end, width/2, height/2);

  fill(255, 0, 0);
  textAlign(CENTER);

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

  text("Level: "+ level, 800, 690);
  text("Next level in:" + nf(timeLeft, 1, 1) + "s", 900, 690);

  text("Health: " + edgar.health, 420, height - 10);
  text("Ammo: " + edgar.spearCount, 620, height - 10);
}
