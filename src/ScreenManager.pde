// -------------------------------------------
// GLOBALS
// -------------------------------------------
char screen = 'S';   // S = start, M = menu, T = settings, P = play, U = pause, G = game over, A = app stats
Button btnStart, btnMenu, btnBack;


// MOUSE CLICK HANDLER

void mousePressed() {

  switch(screen) {

    case 'S':  // Start screen
      if (btnStart.clicked()) screen = 'M';
      break;

    case 'M':  // Menu screen
      if (btnMenu.clicked()) screen = 'P';
     
      break;

    case 'T':  // Settings screen
      if (btnBack.clicked()) screen = 'M';
      break;

    case 'P': // Play screen
      if (btnBack.clicked()) screen = 'M';
      break;
  }
}

// -------------------------------------------
// SCREEN DRAW METHODS
// -------------------------------------------
void drawStart() {
  background(100, 160, 200);
  textAlign(CENTER);
  textSize(32);
  text("START SCREEN", width/2, 50);
  btnStart.display();
}

void drawMenu() {
  background(120, 200, 140);
  textSize(32);
  text("MENU SCREEN", width / 2, 50);

  btnMenu.display();
}

void drawSettings() {
  background(200, 150, 120);
  textSize(32);
  text("SETTINGS", width / 2, 50);

  btnBack.display();
}
void drawPlay() {}
