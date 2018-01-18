//new copy

class Player {
  float x, y, startY; 
  float dy;
  int h=24;
  int w=32;
  boolean jump, left, right, climb, climbDown;
  boolean onPlatform, onLadder;

  Player(float _x, float _y) {
    x=_x;
    y=_y;
  }
  void display() {

    image(jumpman, x, y, 32, 24);
  }
  void move() {
    if (left==true && climb==false ) {
      x-=3;
    } else if (right== true&&climb==false) {
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
    if (fall()) {
      y+=dy;
      dy+=GRAVITY;
    }
  } 

  void jump() {
    y=startY;
    if (jump==true) {
      y+=dy;
      dy+=GRAVITY ;
      if (y>startY) {
        y=startY;
        jump=false;
      }
    }
  }


  boolean fall() {
    if (onLadder) {
      return false;
    } else if (onPlatform) {
      return false;
    }
    if (y>ground) {
      y=ground;
      return false;
    }
    else{
    return true;
    }
  }


  void stand() {
    if (climb==false) {
      for (Platform thisPlatform : thePlatforms) {
        if (onPlatform) {
          y=thisPlatform.y-h;
        }
      }
    }
  }

  void checkOnPlatform() {
    for (Platform thisPlatform : thePlatforms) {
      if (x>=thisPlatform.x &&
        x <= thisPlatform.x+thisPlatform.w &&
        y+h<= thisPlatform.y-5&&
        thisPlatform.y<=y+y+50) {
        onPlatform=true;
      } else {
        onPlatform=false;
      }
    }
  }
  void checkOnLadder() {
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
  int h() {
    return h;
  }
}