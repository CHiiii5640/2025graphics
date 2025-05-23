//week13_6_combine_all_Movie_Capture_PImage_camera_sin_cos_P3D
//把今天教得全加入

import processing.video.*;  

Movie movie;    // 影片用的變數
PImage img;     
Capture video;  // 攝影機畫面

void setup() {
  size(400, 400, P3D);  
  movie = new Movie(this, "street.mov"); 
  movie.loop();  // 重複播放影片
  img = loadImage("chessboard.png");  // 載入圖片
  textureMode(NORMAL);  // 貼圖座標 0~1（預設是像素）

  video = new Capture(this, 640, 480);  // 啟動攝影機
  video.start();
}

void draw() {
  background(128);  
  noStroke();  

  // 這行是讓視角自己繞圈圈轉（每一幀角度變一點點）
  camera(
    200, 200, 200,
    200 + cos(radians(frameCount)), 200,
    200 + sin(radians(frameCount)),
    0, 1, 0
  );

  // 影片有新畫面就讀進來
  if (movie.available()) movie.read();

  // 前面貼圖片（棋盤）
  beginShape();
  texture(img);
    vertex(0, 0, 0, 0, 0);
    vertex(400, 0, 0, 1, 0);
    vertex(400, 400, 0, 1, 1);
    vertex(0, 400, 0, 0, 1);
  endShape();

  // 稍微往前推一點（避免圖層重疊）
  translate(0, 0, 1);
  image(movie, 0, 0, 360, 240);  // 把影片畫到左上角（2D 貼）

  // 攝影機有畫面就讀進來
  if (video.available()) video.read();

  // 左邊貼攝影機畫面（畫一片垂直的牆）
  beginShape();
  texture(video);
    vertex(0, 0, 0, 0, 0);
    vertex(0, 400, 0, 0, 1);
    vertex(0, 400, 400, 1, 1);
    vertex(0, 0, 400, 1, 0);
  endShape();
}
