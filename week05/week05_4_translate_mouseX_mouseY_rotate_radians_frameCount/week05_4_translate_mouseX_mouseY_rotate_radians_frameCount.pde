//week05-4_translate_mouseX_mouseY_rotate_radians_frameCount
//比較rotate 與 translate順序
void setup(){
  size(400,400);
}
void draw(){
  background(204);
  //畫東西之前的translate()才有效果
  //畫圖時 會照著之前 [累積的移動、旋轉]
  translate(mouseX,mouseY);//跟著滑鼠走
  rotate(radians(frameCount));//1秒60個frame 轉60度
  rect(-50,-5,100,10);//寬度100 左上角
}
