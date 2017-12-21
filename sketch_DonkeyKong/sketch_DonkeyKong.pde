// donkeykong 1981
//anthony y

//GLOBALS
int [][][][][]dataForLevels;
float gameSpeed=frameRate;
ArrayList <Platform> thePlatforms=new ArrayList<Platform>();
ArrayList<Ladder> theLadders=new ArrayList<Ladder>();
int stage;
Player jumpMan;
float GRAVITY, startY ;
boolean straightJump=false;


void setup() {
  
  
  GRAVITY =0.2;
  size(800, 800);
  stage=1;
  jumpMan= new Player(width/2, height-50);
  
  

  }
   
}






void draw() {
  if (stage==1) {
    runLevel1();
  }
}

void runLevel1() {
  background(0);
  
  
  //jumpMan
  jumpMan.move();
  jumpMan. jump();
  jumpMan.display();
  
  //thePlatforms
  
  // theLadders
  
  //theMonkey
  
  //theBarrels
  
  
  
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
  else if (keyCode==UP&& jumpMan.canClimb== true){
    jumpMan.climb();
  }
}

void keyReleased() {
  if (key!=' ' ) {
    jumpMan.right= false;
    jumpMan.left= false;
  }
}