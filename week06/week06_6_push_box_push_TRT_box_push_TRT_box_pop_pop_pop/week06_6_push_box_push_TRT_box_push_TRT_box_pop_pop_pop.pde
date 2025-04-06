// week06-6_push_box_push_TRT_box_push_TRT_box_pop_pop_pop
void setup(){
  size(500,400,P3D);
}
void draw(){
  background(255); // Step00 設定背景顏色
  translate(width/2,height/2); // Step01 將原點移至畫面中心
  sphere(10); // Step02 繪製中心參考球體

  fill(252,131,77); // Step03 設定手臂顏色
  pushMatrix();
    box(50,200,25); // Step04 繪製手臂
    pushMatrix();
      translate(x,y); // Step05 根據滑鼠拖曳位置移動
      if(mousePressed)
        rotateZ(radians(frameCount)); // Step06 沿著 Z 軸旋轉
      translate(100,0); // Step07 移動至手肘右端
      box(200,50,25); // Step08 繪製手肘

      pushMatrix();
        translate(100,0); // Step09 移動至手腕右端
        rotateZ(radians(frameCount)); // Step10 沿著 Z 軸旋轉
        translate(25,0,0); // Step11 向右平移，將手腕左端放置於圓心
        box(50,25,50); // Step12 繪製手腕
      popMatrix();
    popMatrix();
  popMatrix();
}
float x=0,y=0;
void mouseDragged(){
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
}
