//translate_rotate
void setup(){
  size(400,400,P3D); //設定opengl
}
float angle=0;
void draw(){
  background(0);//清背景
  translate(200,200);//往200,200移動
  rotate(angle);//座標0,0轉動
  angle+=0.01;
  beginShape(TRIANGLES);
  fill(255,0,0); vertex(0,100*2);
  fill(0,255,0); vertex(87*2,-50*2);
  fill(0,0,255); vertex(-87*2,-50*2);
  endShape();
}
