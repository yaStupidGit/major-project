class Platform {
  int x, y;
  int w=32;
  int h=16;
  
  Platform(int _x, int _y) {
    x=_x;
    y=_y;
  }


  void display() {
    noStroke();
    fill(0, 0, 255,100);
    rect(x, y, w, h);
  }
}