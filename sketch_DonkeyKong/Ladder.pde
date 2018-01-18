class Ladder {
  int x, y,h;
  int w=16;

  Ladder(int _x, int _y,int _h) {
    x=_x;
    y=_y;
    h=_h;
    
  }
  
  void display(){
    fill(255,100,227);
    rect(x,y,w,h);
  }

  int h() {
    return h;
  }
  int w() {
    return w;
  }
  int x() {
    return x;
  }
  int y() {
    return y;
  }
}