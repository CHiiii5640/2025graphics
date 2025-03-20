//week05-5_rotate_radians_frameCount_translate_mouseX_mouseY
//比較rotate 與 translate順序
void setup(){
  size(400,400);
}
void draw(){
  background(204);
  //畫東西之前的translate()才有效果
  //畫圖時 會照著之前 [累積的移動、旋轉]
  rotate(radians(frameCount));//1秒60個frame 轉60度
  translate(mouseX,mouseY);//跟著滑鼠走
  rect(-50,-5,100,10);//寬度100 左上角
}
