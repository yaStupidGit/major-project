// donkeykong 1981
//anthony y

Ladder a;
Platform b;


float gameSpeed=frameRate;
//ArrayList <Platform> thePlatforms;
int stage;
Player jumpMan;
float GRAVITY, startY ;
boolean straightJump=false;


void setup() {
  a=new Ladder(100,height-100,100,30);
  b=new Platform(100,height-200,70,50);
  
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
  jumpMan.move();
  jumpMan. jump();
  a.display();
  b.display();
  jumpMan.display();
}   
    

void keyPressed() {
  if (keyCode==RIGHT&& jumpMan.jump==false) {
    jumpMan.right=true;
  } else if (keyCode==LEFT&& jumpMan.jump==false) {
    jumpMan.left= true;
  } 
  else if (key==' ' && jumpMan.jump==false) {
    jumpMan.jump=true;
    jumpMan.startY=jumpMan.y;
    jumpMan.dy=-4;
    if (jumpMan.left==false && jumpMan.right==false){
      straightJump=true;
      jumpMan.dy=-5;
      
    }
  }  
}

void keyReleased() {
  if (key!=' ' ) {
    jumpMan.right= false;
    jumpMan.left= false;
  }
}