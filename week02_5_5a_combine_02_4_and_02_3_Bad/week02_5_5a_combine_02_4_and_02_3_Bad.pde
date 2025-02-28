//week02-5_5a_combine_02-4_and_02-3_Bad
PImage img;
void setup(){
  size(400,400);
  img=loadImage("usagi.jpg");
}
void draw(){
  background(img);
  fill(255,200);//半透明色彩(白色)
  rect(0,0,400,400);//畫一個四邊形蓋住
  
  stroke(255,0,0); //紅線
  if(mousePressed) line(mouseX,mouseY,pmouseX,pmouseY);
}
