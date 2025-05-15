//week13_1_processing_video
//sketch_Libary_Manage Libaries
import processing.video.*;
//有視訊鏡頭的
Capture video;
Movie movie;//沒鏡頭的版本
void setup(){
  size(640,960);//常見的視訊風格
  video=new Capture(this,640,480);
  video.start();//打開視訊
  movie = new Movie(this,"street.mov");
  movie.loop();
}
void draw(){
  if(video.available()) video.read();
  image(video,0,480);
  if(movie.available()) movie.read();
  image(movie,0,0);
}
