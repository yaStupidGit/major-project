// donkeykong 1981
//anthony y

int stage;
Player jumpMan;
float gravity;

void setup() {
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
  println(jumpMan.dy);//test
}

void keyPressed() {
  if (keyCode==RIGHT) {
    jumpMan.right=true;
  } else if (keyCode==LEFT) {
    jumpMan.left= true;
  } 
  else if (key==' ') {
    jumpMan.jump=true;
  }  
}

void keyReleased() {
  if (key!=' ') {
    jumpMan.right= false;
    jumpMan.left= false;
  }
}