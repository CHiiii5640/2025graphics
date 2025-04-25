// week10_2_giant_head_body_push_trt_pop
PImage giant, head, body;
void setup(){
  size(670, 600);
  giant = loadImage("giant.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
}
void draw(){
  background(#FFFFF2);
  image(giant, 0, 0); // 基礎的郵差先生(全身)
  fill(255, 0, 255, 128); // 半透明的紫色
  rect(0, 0, 760, 600); // 蓋上去
  pushMatrix();
    translate(+236, +231); // 再放回去正確的位置
    rotate(radians(mouseX));
    translate(-236, -231); // 把頭的旋轉中心, 放到(0,0)
    image(head, 0, 0); // 再畫頭
  popMatrix();
  image(body, 0, 0); // 再畫身體
}
