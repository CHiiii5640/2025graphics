// week15_01_multiple_windows
// 多個獨立視窗的範例（主視窗 + 子視窗）

void setup(){
  size(300,200);
  background(255,0,0);
  WindowB child = new WindowB(); // 建立一個子視窗（會跑自己一套 setup/draw）

}

void draw(){ // 主視窗
  
}
// 以下會獨立執行
// 子視窗類別（會自己執行自己的 settings、setup、draw）
class WindowB extends PApplet{
  public WindowB(){ // 建構子:建立子視窗
    super(); // 呼叫 PApplet 父類別的初始化
    // 啟動新的 PApplet 實例，讓它獨立執行自己的程式
    PApplet.runSketch(new String[]{this.getClass().getName()},this);
  }
  
  public void settings(){
    size(300,200); // 子視窗大小
  }
  public void setup(){
    //size(300,200);
    background(0,255,0);
  }
  
  public void draw(){ // 子視窗
  
  }
}
