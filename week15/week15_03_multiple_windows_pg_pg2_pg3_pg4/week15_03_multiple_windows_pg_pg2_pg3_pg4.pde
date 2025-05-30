// week15_03_multiple_windows_pg_pg2_pg3_pg4
// 修改 week15_02_multiple_window_PGraphics
// 建立四個子視窗，分別顯示不同顏色與旋轉方塊

PGraphics pg, pg2, pg3, pg4;  // 宣告一個 PGraphics，用來當作獨立畫布

void setup() {
  size(400, 400, P3D);          // 主視窗尺寸與 3D 模式
  pg = createGraphics(200, 200, P3D); // 建立一塊 200x200 的 3D 畫布（子畫面）
  pg2 = createGraphics(200, 200, P3D); // 建立一塊 200x200 的 3D 畫布（子畫面）
  pg3 = createGraphics(200, 200, P3D); // 建立一塊 200x200 的 3D 畫布（子畫面）
  pg4 = createGraphics(200, 200, P3D); // 建立一塊 200x200 的 3D 畫布（子畫面）
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

  pg2.beginDraw();
    pg2.background(255, 255, 0);   // 子畫布背景設為黃色
    pg2.translate(100, 100);    // 將原點移到畫布中心
    pg2.rotateY(radians(frameCount)); // 每幀旋轉 Y 軸
    pg2.fill(0, 100, 255); // 藍色
    pg2.box(100);               // 繪製一個 3D 方塊
  pg2.endDraw();
 
  pg3.beginDraw();
    pg3.background(255, 0, 0);   // 子畫布背景設為紅色
    pg3.translate(100, 100);    // 將原點移到畫布中心
    pg3.rotateY(radians(frameCount)); // 每幀旋轉 Y 軸
    pg3.fill(0); // 黑色
    pg3.box(100);               // 繪製一個 3D 方塊
  pg3.endDraw();

  pg4.beginDraw();
    pg4.background(255, 0, 255);   // 子畫布背景設為紫色
    pg4.translate(100, 100);    // 將原點移到畫布中心
    pg4.rotateY(radians(frameCount)); // 每幀旋轉 Y 軸
    pg4.fill(0, 255, 180); // 青綠色
    pg4.box(100);               // 繪製一個 3D 方塊
  pg4.endDraw();

  // 把 pg 畫布畫到主視窗左上角（x=0, y=0）
  image(pg, 0, 0);
  image(pg2, 200, 0);
  image(pg3, 0, 200);
  image(pg4, 200, 200);
}
