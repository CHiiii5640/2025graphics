// week06-4_sphere_box_push_T_R_T_box_pop
void setup(){
  size(500,400,P3D);
}
void draw(){
  background(255); // Step00 設定背景顏色
  translate(width/2,height/2); // Step01 將原點移至畫面中心
  sphere(10); // Step02 繪製中心參考球體

  box(200,50,25); // Step03 繪製手肘

  fill(252,131,77); // Step04 設定手腕顏色
  pushMatrix();
    translate(x,y); // Step05 根據滑鼠拖曳位置移動
    if(mousePressed)
      rotateZ(radians(frameCount)); // Step06 沿著 Z 軸旋轉
    translate(25,0,0); // Step07 向右平移，將手腕左端放置於圓心
    box(50,25,50); // Step08 繪製小手腕
  popMatrix();
}
float x=0,y=0;
void mouseDragged(){
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
}
