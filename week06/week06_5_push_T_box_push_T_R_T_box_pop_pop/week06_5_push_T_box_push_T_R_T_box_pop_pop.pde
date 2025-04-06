// week06-5_push_T_box_push_T_R_T_box_pop_pop
void setup(){
  size(500,400,P3D);
}
void draw(){
  background(255); // Step00 設定背景顏色
  translate(width/2,height/2); // Step01 將原點移至畫面中心
  sphere(10); // Step02 繪製中心參考球體

  fill(252,131,77); // Step03 設定手臂顏色
  pushMatrix();
    translate(x,y); // Step04 根據滑鼠拖曳位置移動
    box(200,50,25); // Step05 繪製手肘

    pushMatrix();
      translate(100,0); // Step06 移動至手肘右端
      rotateZ(radians(frameCount)); // Step07 沿著 Z 軸旋轉
      translate(25,0,0); // Step08 向右平移，將手腕左端放置於圓心
      box(50,25,50); // Step09 繪製手腕
    popMatrix();
  popMatrix();
}
float x=0,y=0;
void mouseDragged(){
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
}
