// donkeykong 1981
//anthony y
ArrayList <Platform> thePlatforms;
int stage;
Player jumpMan;
float GRAVITY, startY ;

void setup() {
  GRAVITY =0.2;
  size(800, 800);
  stage=1;
  jumpMan= new Player(width/2, height-50);
   
}
void draw() {
  if (stage==1) {
    runLevel1();
  }
}

void runLevel1() {
  background(0);
  jumpMan.display();
  jumpMan.move();
  jumpMan. jump();
  println(jumpMan.y);//test
  println(jumpMan.jump);//test
}   
    

void keyPressed() {
  if (keyCode==RIGHT&& jumpMan.jump==false) {
    jumpMan.right=true;
  } else if (keyCode==LEFT&& jumpMan.jump==false) {
    jumpMan.left= true;
  } 
  else if (key==' '&&jumpMan.jump==false) {
    jumpMan.jump=true;
    jumpMan.startY=jumpMan.y;
    jumpMan.dy=-4;
  }  
}

void keyReleased() {
  if (key!=' ' ) {
    jumpMan.right= false;
    jumpMan.left= false;
  }
}