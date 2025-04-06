// week06-7_push_RRT_many_TRT_inside_pop
void setup(){
  size(500,800,P3D);
}
void draw(){
  background(255); // Step00 設定背景顏色
  translate(width/2,height/2); // Step01 將原點移至畫面中心
  sphere(10); // Step02 繪製中心參考球體

  fill(252,131,77); // Step03 設定手臂顏色
  pushMatrix();
    if(mousePressed && mouseButton==RIGHT)
      rotateY(radians(frameCount)); // Step04 沿著 Y 軸旋轉
    if(mousePressed && mouseButton==RIGHT)
      rotateZ(radians(frameCount)); // Step05 沿著 Z 軸旋轉
    translate(0,-100); // Step06 向上平移，調整手臂位置
    box(50,200,25); // Step07 繪製手臂

    pushMatrix();
      translate(0,-100); // Step08 移動至手臂頂端
      rotateZ(radians(frameCount)); // Step09 沿著 Z 軸旋轉
      translate(100,0); // Step10 移動至手肘右端
      box(200,50,25); // Step11 繪製手肘

      pushMatrix();
        translate(100,0); // Step12 移動至手腕右端
        rotateZ(radians(frameCount)); // Step13 沿著 Z 軸旋轉
        translate(25,0,0); // Step14 向右平移，將手腕左端放置於圓心
        box(50,25,50); // Step15 繪製手腕
      popMatrix();
    popMatrix();
  popMatrix();
}
float x=0,y=0;
void mouseDragged(){
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
}
