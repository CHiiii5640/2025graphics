//week13_2_camera_movie_eye_center_up
// 用滑鼠控制攝影機位置，搭配影片播放。camera(eye, center, up) 的基礎練習

import processing.video.*;

Movie movie;

void setup() {
  size(600, 400, P3D);
  movie = new Movie(this, "street.mov"); 
  movie.loop();  // 影片循環播放
}

void draw() {
  background(128);

  // camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  // 攝影機位置跟著滑鼠移動，看向 (300, 200, 0) 固定點
  // up 設為 (0, 1, 0) → 表示 Y 軸是「上」
  camera(mouseX, mouseY, 120,   // 攝影機位置（眼睛）
         300, 200, 0,           // 看的目標點
         0, 1, 0);              // 哪個方向是上

  // 播影片（貼到畫面上）
  if (movie.available()) movie.read();
  image(movie, 0, 0);  // 貼影片畫面（等於是背景）
}
