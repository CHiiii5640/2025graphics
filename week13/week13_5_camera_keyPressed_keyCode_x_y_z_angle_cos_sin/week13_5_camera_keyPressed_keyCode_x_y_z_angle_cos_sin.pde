////week13-5_camera_keyPressed_keyCode_x_y_z_angle_cos_sin
// 改自 week03_4：用方向鍵控制相機移動方向，類似主角走動感覺

PImage img;

void setup() {
  size(400, 400, P3D);  
  img = loadImage("chessboard.png");  
  textureMode(NORMAL);  // 貼圖座標用 0~1
}

// 相機初始位置與角度
float x = 200, y = 200, z = 200, angle = 180;

// 按鍵控制方向與前後移動
void keyPressed() {
  if (keyCode == LEFT)  angle--;  // 左轉
  if (keyCode == RIGHT) angle++;  // 右轉
  if (keyCode == UP) {            // 向前走
    x += cos(radians(angle));
    z += sin(radians(angle));
  }
  if (keyCode == DOWN) {          // 向後退
    x -= cos(radians(angle));
    z -= sin(radians(angle));
  }
}

void draw() {
  if (keyPressed) keyPressed();

  // 設定相機位置與觀看方向
  // 相機位置 (x,y,z)，看向 (x+cos, y, z+sin) → 看「面前」
  camera(x, y, z,
         x + cos(radians(angle)), y, z + sin(radians(angle)),
         0, 1, 0);

  background(128);  

  // 正面貼圖（棋盤圖）
  beginShape();
  texture(img);
    vertex(0, 0, 0, 0, 0);
    vertex(400, 0, 0, 1, 0);
    vertex(400, 400, 0, 1, 1);
    vertex(0, 400, 0, 0, 1);
  endShape();

  // 左邊牆壁貼圖
  beginShape();
  texture(img);
    vertex(0, 0, 0, 0, 0);
    vertex(0, 400, 0, 1, 0);
    vertex(0, 400, 400, 1, 1);
    vertex(0, 0, 400, 0, 1);
  endShape();
}
