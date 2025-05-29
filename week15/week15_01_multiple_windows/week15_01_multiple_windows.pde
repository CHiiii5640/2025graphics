//week15_01_multiple_windows

void setup(){
  size(300,200);
  background(255,0,0);
  WindowB child = new WindowB();

}

void draw(){
  
}

class WindowB extends PApplet{
  public WindowB(){ //建構子
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()},this);
  }
  
  public void settings(){
    size(300,200);
  }
  public void setup(){
    //size(200,200);
    background(0,255,0);
  }
  
  public void draw(){
  
  }
}
