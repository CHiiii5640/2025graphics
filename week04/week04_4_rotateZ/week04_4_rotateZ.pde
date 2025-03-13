//week04-4_rotateZ
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  translate(width/2,height/2);
  //rotateY(radians(mouseX)); //左右
  rotateZ(radians(mouseX)); //上下
  ellipse(0,0,100,150);
}
