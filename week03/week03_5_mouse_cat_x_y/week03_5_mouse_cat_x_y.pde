//week03-5_mouse_cat_x_y
void setup(){
  size(400,400);
}
float x,y; //貓的座標
void draw(){
  background(255);
  ellipse(x,y,40,20);
  ellipse(mouseX,mouseY,40,20);
  x=(x*14+mouseY)/15;
  y=(y*14+mouseY)/15;
}
