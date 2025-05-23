//week13-4_camera_chaseboard_texture_front_left
// 貼圖整合 camera 視角，滑鼠控制攝影機位置（有點像第一人稱移動視角）

PImage img;

void setup() {
  size(400, 400, P3D); 
  img = loadImage("chessboard.png"); 
  textureMode(NORMAL);  // 用 0~1 的貼圖座標
}

void draw() {
  // 相機位置根據滑鼠 X、Y 改變（Y 固定在 200）
  // 看的方向往滑鼠前方 10 單位
  camera(
    mouseX, 200, mouseY,        // 相機位置
    mouseX, 200, mouseY - 10,   // 看哪裡（往前看）
    0, 1, 0                     // 哪個方向是上
  );

  background(128); 

  // 前方牆壁，貼上圖片
  beginShape();
    texture(img);
    vertex(0, 0, 0, 0, 0);
    vertex(400, 0, 0, 1, 0);
    vertex(400, 400, 0, 1, 1);
    vertex(0, 400, 0, 0, 1);
  endShape();

  // 左側牆壁，也貼圖片
  beginShape();
    texture(img);
    vertex(0, 0, 0, 0, 0);
    vertex(0, 400, 0, 1, 0);
    vertex(0, 400, 400, 1, 1);
    vertex(0, 0, 400, 0, 1);
  endShape();
}
