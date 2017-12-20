class Ladder {
  int x, y, h, w;

  Ladder(int _x, int _y, int _h, int _w) {
    x=_x;
    y=_y;
    h=_h;
    w=_w;
  }
  
  void display(){
    fill(255,100,227);
    rect(x,y,w,h);
  }

  int h() {
    return h;
  }
  int x() {
    return x;
  }
  int y() {
    return y;
  }
}