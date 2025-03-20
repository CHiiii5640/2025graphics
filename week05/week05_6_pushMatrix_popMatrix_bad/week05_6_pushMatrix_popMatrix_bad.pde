//week05-6_pushMatrix_popMatrix_bad
//多層移動 push pop 分階層做事
void setup(){
  size(400,400);
}
void draw(){
 background(204);
 translate(width/2,height/2);
 rotate(radians(frameCount)*10);
 rect(-50,-5,100,10);
 
 translate(width/2-100,height/2);
 rotate(radians(frameCount)*10);
 rect(-50,-5,100,10);
}
