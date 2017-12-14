class Player{
  int x,y;
  int h=30;
  int w=30;
  
  Player(int _x,int _y){
    x=_x;
    y=_y;
    
  }
  void display(){
    fill(255,0,0);
    rect(x,y,h,w);
  }
  void jump(){
  }
}