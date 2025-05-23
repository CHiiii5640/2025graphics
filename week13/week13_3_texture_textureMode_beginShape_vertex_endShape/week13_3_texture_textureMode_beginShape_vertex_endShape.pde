//week13-3_texture_textureMode_beginShape_vertex_endShape
// 如何用 beginShape() 自訂形狀 + texture() 把圖片貼上去

PImage img;

void setup() {
  size(400, 400, P3D); 
  img = loadImage("chessboard.png");  
  textureMode(NORMAL);  // 貼圖座標用 0~1（如果是 IMAGE 就是像素座標）
}

void draw() {
  background(128);  

  // 開始畫一個四邊形，並貼圖上去
  beginShape();
    texture(img);  // 指定用這張圖片當貼圖

    // vertex(x, y, z, u, v)
    // z 設為 0 表示都是平面（沒厚度）
    // u,v 是貼圖座標（0~1）
    vertex(40, 80, 0, 0, 0);     // 左上角
    vertex(320, 20, 0, 1, 0);    // 右上角
    vertex(380, 360, 0, 1, 1);   // 右下角
    vertex(160, 380, 0, 0, 1);   // 左下角
  endShape();
}
