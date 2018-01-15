class Player {
  float x, y, startY; 
  float dy;
  int h=30;
  int w=30;
  boolean jump, left, right, climb, climbDown;

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
    } else if (climb==true) {
      y-=3;
      if (canClimb()==false) {
      climb=false;
      y+=6;
    }
      
    } else if (climbDown==true) {
      y+=3;
      if (canClimb()==false) {
      climbDown=false;
      y-=6;
      }
      
    }
    if (canClimb()==false) {
      climbDown=false;
      climb=false;
    }
    if (fall()){
      y+=dy;
      dy+=GRAVITY;
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


  boolean fall() {
    for (Ladder thisLadder : theLadders) {
      if (thisLadder.x>=x&&
        thisLadder.x<x+w) {
        return false;
      }
    }
    for (Platform thisPlatform : thePlatforms) {
      if (thisPlatform.x>=x&&
        thisPlatform.x+64>=x+w) {
        return false;
      }
      if (y>=height-h) {
        y=height-h;
        return false;
      }
    }
    return true;
  }


  boolean canClimb() {
    //checks if player is on a ladder and allows player t interact
    for (Ladder thisLadder : theLadders) {
      if (x>=thisLadder.x &&
        x<=(thisLadder.w+thisLadder.x) &&
        y>=thisLadder.y-h&&
        y<=(thisLadder.y+thisLadder.h+h)) {
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