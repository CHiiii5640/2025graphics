// week10_1_giant_head_body
// 頭、身體
size(670, 600);
PImage giant = loadImage("giant.png");
PImage head = loadImage("head.png");
PImage body = loadImage("body.png");
background(255,0,255);
image(giant, 0, 0); // 基礎(全身)
fill(255, 0, 255, 128); // 半透明的紫色
rect(0, 0, 670, 600); // 蓋上去
image(head, 0, 0); // 再畫頭
image(body, 0, 0); // 再畫身體
