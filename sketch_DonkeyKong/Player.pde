class Player {
  float x, y, startY; 
  float dy;
  int h=30;
  int w=30;
  boolean jump, canClimb, left, right;

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

    if (jump==true) {
      if (straightJump) {
        
      }
      y+=dy;
      dy+=GRAVITY ;
      if (y>startY) {
        y=startY;
        jump=false;
        straightJump=false;
      }
    }
  }
  void climb(){
    y+=1;
    
    
    
  }
  boolean canClimb(){
    for (Ladder thisLadder:theLadders){
      if (x>thisLadder.x &&
      x<(thisLadder.w+thisLadder.x) &&
      y>thisLadder.y&&
      y<(thisLadder.y+thisLadder.h)){
        return true;
        
      }
    }
    return false;    
  }



  float x() {
    return x;
  }
  float dy() {
    return dy;
  }
}