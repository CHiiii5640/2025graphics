//week13_1_processing_video
// 上面播放影片（movie），下面是鏡頭畫面（video）
// 學習使用 Capture 與 Movie 兩種來源的影像

import processing.video.*;

// video 是攝影機畫面
Capture video;

// movie 是影片
Movie movie;

void setup() {
  size(640, 960);  // 畫布大小：640x960，剛好上半部影片、下半部鏡頭

  video = new Capture(this, 640, 480);  // 建立鏡頭畫面（解析度）
  video.start();  // 開啟攝影機

  movie = new Movie(this, "street.mov");  // 載入影片檔
  movie.loop();  // 重複播放影片
}

void draw() {
  // 有畫面就讀進來
  if (video.available()) video.read();
  if (movie.available()) movie.read();

  image(movie, 0, 0);       // 上半部：播放影片
  image(video, 0, 480);     // 下半部：顯示攝影機畫面
}
