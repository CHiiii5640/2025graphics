// week02-5_ArrayList_Integer_new_for_size_get_add_mouseDragged
//用資料結構 把歷史軌跡 留下來
ArrayList<Integer> x=new ArrayList<Integer>();
ArrayList<Integer> y=new ArrayList<Integer>();
PImage img;
void setup(){
  size(400,400);
  img=loadImage("usagi.jpg");
}
void draw(){
  background(img);
  fill(255,200);//半透明色彩(白色)
  rect(0,0,400,400);//畫一個四邊形蓋住

  for(int i=1;i<x.size();i++){
    line(x.get(i),y.get(i),x.get(i-1),y.get(i-1));
  }
}
void mouseDragged(){
  x.add(mouseX);
  y.add(mouseY);
}
