//week13_2_camera_movie_eye_center_up
//電腦圖學會圖時，會設定camara的相關係數
import processing.video.*;
Movie movie;
void setup(){
  size(600,400,P3D);
  movie = new Movie(this,"street.mov");
  movie.loop();
}
void draw(){
  background(128);
  camera(mouseX,mouseY,120,300,200,0, 0,1,0);
  //很多參數eyeX,eyeY,eyeZ,centerX,centerY,centerZ,upX,upY,upZ
 
  if(movie.available()) movie.read();
  image(movie,0,0);
}
