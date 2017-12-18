class Platform{
  int x,y,h,w;
  
  
  Platform(int _x,int _y,int _h,int _w){
    x=_x;
    y=_y;
    h=_h;
    w=_w;
  }
  
  
  void display(){
    noStroke();
    fill(0,0,255);
    rect(x,y,h,w);
  }
}