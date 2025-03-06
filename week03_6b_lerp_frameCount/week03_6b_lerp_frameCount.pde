//week03-6b_lerp_frameCount
void setup() {
  size(400, 400);
}
float startX=10, startY=10;
float stopX=390, stopY=390;
void draw() {
  background(255);
  ellipse(startX, startY, 10, 10);
  ellipse(stopX, stopY, 10, 10);
  //lerp()可以做內插 要給他0~1.0之間的數
  float midX=lerp(startX, stopX, frameCount/200.0);
  float midY=lerp(startY, stopY, frameCount/200.0);
  //frameCount是第幾個 畫面
  ellipse(midX, midY, 10, 10);
}
