//week06-3_push_translate_rotate_translate_box_pop
void setup(){
  size(500,500,P3D);
}
void draw(){
  background(142);
  ellipse(width/2,height/2,200,200);
  
  translate(width/2,height/2);//畫面中心
  pushMatrix();
    translate(x,y);
    if(mousePressed && mouseButton==RIGHT)//按下滑鼠才會動
      rotateZ(radians(frameCount));//對著下面中心旋轉
    translate(-50,0,0);//把物體往左移一半，讓右端放在正中心
    box(100,30,30);
   popMatrix();
}
float x=0,y=0;
void mouseDragged(){
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
}
