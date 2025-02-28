//week02-4_PImage_loadImage_background_fill_println
PImage img;
void setup(){
  size(400,400);
  img=loadImage("usagi.jpg");
}
void draw(){
  background(img);
  fill(255,mouseX);//半透明色彩(白色)
  println(mouseX); //把mouseX的值 在底下輸出
  rect(0,0,400,400);//畫一個四邊形蓋住
}
