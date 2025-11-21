//Kirubashinilakshana
class Wall {
  int x, y, w, h;

  Wall(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    fill(100, 100, 100);
    noStroke();
    rect(x, y, w, h);
  }
}
