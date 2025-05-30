// week15_02_multiple_window_PGraphics
// PGraphics 模擬第二個視窗（可獨立畫圖）

PGraphics pg;  // 宣告一個 PGraphics，用來當作獨立畫布

void setup() {
  size(400, 400, P3D);          // 主視窗尺寸與 3D 模式
  pg = createGraphics(200, 200, P3D); // 建立一塊 200x200 的 3D 畫布（子畫面）
}

void draw() {
  background(255, 0, 0);
  // 在 pg 畫布上開始繪圖（相當於另一個 draw()）
  pg.beginDraw();
    pg.background(0, 255, 0);   // 子畫布背景設為綠色
    pg.translate(100, 100);    // 將原點移到畫布中心
    pg.rotateY(radians(frameCount)); // 每幀旋轉 Y 軸
    pg.box(100);               // 繪製一個 3D 方塊
  pg.endDraw();

  // 把 pg 畫布畫到主視窗左上角（x=0, y=0）
  image(pg, 0, 0);
}
