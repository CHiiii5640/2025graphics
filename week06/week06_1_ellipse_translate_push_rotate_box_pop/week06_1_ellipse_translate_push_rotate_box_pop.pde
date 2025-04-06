//week06-1_ellipse_translate_push_rotate_box_pop
//旋轉立方體
void setup(){
  size(500,500,P3D);
}
void draw(){
  background(142);
  ellipse(width/2,height/2,200,200);// 畫出參考的圓形
  
  translate(width/2,height/2);//畫面中心
  pushMatrix();
    if(mousePressed)// 按下滑鼠時才旋轉
      rotateZ(radians(frameCount)); // 沿著 Z 軸旋轉
    box(100,30,30);
   popMatrix();
}
