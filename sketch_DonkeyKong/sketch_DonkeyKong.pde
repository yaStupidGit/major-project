// donkeykong 1981
//anthony y

//GLOBALS

Platform a;
int [][]dataXForLv1;

float gameSpeed=frameRate;
ArrayList <Platform> thePlatforms=new ArrayList<Platform>();
ArrayList<Ladder> theLadders=new ArrayList<Ladder>();
int stage;
Player jumpMan;
float GRAVITY, startY ;
boolean straightJump=false;


// images




void setup() {

  a= new Platform(100, 100);
  GRAVITY =0.2;
  size(800, 800);
  stage=1;
  jumpMan= new Player(width/2, height-50);



  for (int i=0;i<640;i+=64){
    thePlatforms.add(new Platform(i,height-100));
  }
   
  theLadders.add(new Ladder(100, height-100, 100, 50));

  //leveldata
}

void draw() {
  if (stage==1) {
    runLevel1();
  }
}

void runLevel1() {
  background(0);

  // theLadders
  for (Ladder thisLadder : theLadders) {
    thisLadder.display();
  }
  for (Platform thisPlatform : thePlatforms) {
    thisPlatform.display();
  }


  //jumpMan
  jumpMan.move();
  jumpMan. jump();
  jumpMan.display();
  //println(jumpMan.canClimb());
  //println(jumpMan.climb);

  //thePlatforms
  a.display();

  //theMonkey

  //theBarrels
}






void keyPressed() {
  println(jumpMan.canClimb()+"can climb");
  if (keyCode==RIGHT&& jumpMan.jump==false) {
    jumpMan.right=true;
  } else if (keyCode==LEFT&& jumpMan.jump==false) {
    jumpMan.left= true;
  } else if (key==' ' && jumpMan.jump==false) {
    jumpMan.jump=true;
    jumpMan.startY=jumpMan.y;
    jumpMan.dy=-4;
    if (jumpMan.left==false && jumpMan.right==false) {
      straightJump=true;
      jumpMan.dy=-5;
    }
  } else if (keyCode==UP && jumpMan.canClimb()==true) {
    jumpMan.y-=5;
    jumpMan.climb=true;

  } else if (keyCode==DOWN && jumpMan.canClimb()==true) {    
    jumpMan.y+=5;
    jumpMan.climbDown=true;
  }
}

void keyReleased() {
  if (key!=' ' ) {
    jumpMan.right= false;
    jumpMan.left= false;
    jumpMan.climb=false;
    jumpMan.climbDown=false;
  }
}