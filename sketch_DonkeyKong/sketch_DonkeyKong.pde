// donkeykong 1981
//anthony y

int stage;
Player jumpMan;


void setup(){
  size(800,800);
  stage=1;
  jumpMan= new Player(width/2,height-50);
  
}
void draw(){
  if (stage==1){
    runLevel1();
  }
  
  
}

void runLevel1(){
  background(0);
  jumpMan.display();
  
}

void keyPressed(){
  if (key==RIGHT){
  }
  else if (key==LEFT){
  }
  else if (key==' '){
  }
}