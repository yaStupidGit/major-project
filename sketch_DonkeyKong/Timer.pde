class Timer{// times events
// info 
  float startTime,elapseTime, endTime; 
//const.  
  Timer(int _elapseTime){
    elapseTime=_elapseTime;
  }
  
  void activate(){
    startTime=millis();
    endTime= startTime+elapseTime;
    
  }
  
  boolean done(){
    if (millis()>=endTime){
      return true;
    }
    return false;
  
  }
  void waitTime(int _elapseTime){
    elapseTime = _elapseTime; 
  }   
}