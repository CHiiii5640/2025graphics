//week06-2_ellipse_translate_push_rotate_translate_box_pop
//再加一個移動 把物體放到[轉盤的中心]
void setup(){
  size(500,500,P3D);
}
void draw(){
  background(142);
  ellipse(width/2,height/2,200,200);
  
  translate(width/2,height/2);//畫面中心
  pushMatrix();
    if(mousePressed)//按下滑鼠才會動
      rotateZ(radians(frameCount));//對著下面中心旋轉
    translate(-50,0,0);//把物體往左移一半，讓右端放在正中心
    box(100,30,30);
   popMatrix();
}
