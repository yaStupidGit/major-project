class Platform {
  int x, y;
  int w=64;
  int h=32;
  
  Platform(int _x, int _y) {
    x=_x;
    y=_y;
  }


  void display() {
    noStroke();
    fill(0, 0, 255);
    rect(x, y, w, h);
  }
}