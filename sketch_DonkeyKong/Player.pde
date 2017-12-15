class Player {
  float x, y; 
  float dy, speed;
  int h=30;
  int w=30;
  boolean jump, left, right;

  Player(float _x, float _y) {
    x=_x;
    y=_y;
  }
  void display() {
    fill(255, 0, 0);
    rect(x, y, h, w);
  }
  void move() {
    if (left==true) {
      x-=3;
    } else if (right== true) {
      x+=3;
    } else if (jump==true) {
      jump();
    } else {
    }
  } 

  void jump() {
    speed=-10;
    y+=speed;
    speed+=gravity;
    
    
    //jump=false;
  }



  float x() {
    return x;
  }
}