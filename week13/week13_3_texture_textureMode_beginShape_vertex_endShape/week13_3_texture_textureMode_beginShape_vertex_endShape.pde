//week13-3_texture_textureMode_beginShape_vertex_endShape
//貼圖
PImage img;
void setup(){
  size(400,400,P3D);
  img = loadImage("chessboard.png");
  textureMode(NORMAL);
}

void draw(){
  background(128);
  beginShape();
    texture(img);
    vertex(40 ,80 ,0 ,0);
    vertex(320 ,20 ,1 ,0);
    vertex(380 ,360 ,1 ,1);
    vertex(160 ,380 ,0 ,1);
  endShape();
}
