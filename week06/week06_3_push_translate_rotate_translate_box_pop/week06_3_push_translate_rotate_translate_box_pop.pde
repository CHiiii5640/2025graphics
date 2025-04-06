//week06-3_push_translate_rotate_translate_box_pop
//拖曳與旋轉的立方體
void setup(){
  size(500,500,P3D);
}
void draw(){
  background(142);
  ellipse(width/2,height/2,200,200);
  
  translate(width/2,height/2);//畫面中心
  pushMatrix();
    translate(x,y);
    if(mousePressed && mouseButton==RIGHT)//按下滑鼠右鍵才會動
      rotateZ(radians(frameCount));//對著Z旋轉
    translate(-50,0,0);// 向左平移，讓立方體右側位於圓心
    box(100,30,30);
   popMatrix();
}
float x=0,y=0;
void mouseDragged(){
  x+=mouseX-pmouseX;// 計算滑鼠水平拖曳距離
  y+=mouseY-pmouseY;// 計算滑鼠垂直拖曳距離
}
