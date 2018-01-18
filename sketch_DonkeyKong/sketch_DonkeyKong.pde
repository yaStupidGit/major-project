// donkeykong 1981
//anthony y

//GLOBALS



DonkeyKong kong;
int brick=32;
int []dataXForLv1= new int[80];
int [] dataYForLv1= new int[80];

float gameSpeed=frameRate;

ArrayList <Platform> thePlatforms=new ArrayList<Platform>();
ArrayList<Ladder> theLadders=new ArrayList<Ladder>();

int stage;
Player jumpMan;
float GRAVITY, startY ;
boolean straightJump=false;
int ground=464;

// images
PImage level1, kongReg, jumpman, stack, oilBarrel;



void setup() {

  GRAVITY =0.2;
  size(494, 544);
  stage=1;
  jumpMan= new Player(34, ground-24);
  kong=new DonkeyKong(64, 72);

  //lv 1 steup for platforms by row from bottom up 
  for (int i=0; i<14; i++) {
    dataXForLv1[i]=20+brick*i;
  }
  for (int i=0; i<13; i++) {
    dataXForLv1[i+14]=20+brick*i;
  }
  for (int i=0; i<13; i++) {
    dataXForLv1[i+27]=brick+20+brick*i;
  }  
  for (int i=0; i<13; i++) {
    dataXForLv1[i+40]=20+brick*i;
  }
  for (int i=0; i<13; i++) {
    dataXForLv1[i+53]=brick+20+brick*i;
  }
  for (int i=0; i<14; i++) {
    dataXForLv1[i+66]=20+brick*i;
  }

  //y value for plaforms by row
  for (int i=0; i<14; i++) {
    if (i>6) {
      dataYForLv1[i]=464-2*i+12;
    } else {
      dataYForLv1[i]=464;
    }
  }
  for (int i=0; i<13; i++) {
    dataYForLv1[i+14]=383+2*i;
  }
  for (int i=0; i<13; i++) {
    dataYForLv1[i+27]=341-2*i;
  }
  for (int i=0; i<13; i++) {
    dataYForLv1[i+40]=252+2*i;
  }
  for (int i=0; i<13; i++) {
    dataYForLv1[i+53]=209-2*i;
  }
  for (int i=0; i<14; i++) {
    if (i>8) {
      dataYForLv1[i+66]=136+2*i-16;
    } else {
      dataYForLv1[i+66]=136;
    }
  } 


  println(dataYForLv1);
  //println(dataXForLv1);


  for (int i=0; i<79; i++) {
    thePlatforms.add(new Platform(dataXForLv1[i], dataYForLv1[i]));
  }

  theLadders.add(new Ladder(388, 406, 50));
  theLadders.add(new Ladder(212, 331, 65));
  theLadders.add(new Ladder(84, 340, 50));
  theLadders.add(new Ladder(244, 265, 70));
  theLadders.add(new Ladder(388, 273, 50));
  theLadders.add(new Ladder(164, 204, 60));
  theLadders.add(new Ladder(84, 208, 50));
  theLadders.add(new Ladder(388, 142, 50));




  // load images
  level1=loadImage("data/level1.png");
  kongReg=loadImage("data/kongRegular.png");
  jumpman=loadImage("data/jumpman.png");
  stack=loadImage("data/stack.png");
  oilBarrel=loadImage("data/oilBarrel.png");
}

void draw() {
  if (stage==1) {
    runLevel1();
  }
}

void runLevel1() {
  image(level1, 0, 0, 494, 544);
  image(oilBarrel, 25, 402, 32, 60);
  image(stack, 20, 70, 40, 64);

  // theLadders
  for (Ladder thisLadder : theLadders) {
    thisLadder.display();
  }
  for (Platform thisPlatform : thePlatforms) {
    thisPlatform.display();
  }


  //jumpMan
  println(jumpMan.onPlatform);
  jumpMan.move();
  jumpMan. jump();
  jumpMan.display();

  //jumpMan.stand();
  jumpMan.checkOnPlatform();
  println(jumpMan.onPlatform);
  jumpMan.fall();


  //thePlatforms


  //theMonkey
  kong.showMeTheMonkey();

  //theBarrels
}


void shootTheBarrels() {
}


void mousePressed() {
  println(mouseX, mouseY);
}



void keyPressed() {
  //println(jumpMan.canClimb()+"can climb");
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