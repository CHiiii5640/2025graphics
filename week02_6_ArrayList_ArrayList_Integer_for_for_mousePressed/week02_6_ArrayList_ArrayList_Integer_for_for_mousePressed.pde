//week02-6_ArrayList_ArrayList_Integer_for_for_mousePressed
//想要有很多段 不 {一筆畫}
ArrayList<Integer> x,y; //先有2個 [還沒準備好]的(小的)資料結構 等mousePressed再新增資料結構
ArrayList<ArrayList<Integer>>xx=new ArrayList<ArrayList<Integer> >(); //大的資料結構
ArrayList<ArrayList<Integer>>yy=new ArrayList<ArrayList<Integer> >();

PImage img;
void setup(){
  size(400,400);
  img=loadImage("usagi.jpg");
}
void draw(){
  background(img);
  fill(255,200);//半透明色彩(白色)
  rect(0,0,400,400);//畫一個四邊形蓋住

 for(int I=0;I<xx.size();I++){ //大寫I對應大的資料結構
     ArrayList<Integer> x=xx.get(I); //取出小資料結構
     ArrayList<Integer> y=yy.get(I);
     for(int i=1;i<x.size();i++){ //小的 繼續畫
       line(x.get(i),y.get(i),x.get(i-1),y.get(i-1));
     }
   }
}

void mouseDragged(){
    x.add(mouseX);
    y.add(mouseY);
 }
void mousePressed(){ //滑鼠按下 創建新的資料結構
  x=new ArrayList<Integer>();xx.add(x);
  y=new ArrayList<Integer>();yy.add(y);
}
