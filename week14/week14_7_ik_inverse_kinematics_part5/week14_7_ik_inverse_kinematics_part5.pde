//week14_7_ik_inverse_kinematics_part5
// 模擬 IK：使用向量運算，讓最後一節（p[5]）固定連到滑鼠方向但長度不變

PVector[] p = new PVector[6];  // 六個節點（p[0]~p[5]）

void setup() {
  size(400, 400);

  // 初始化節點：每節往上堆，間距 50 像素
  for (int i = 0; i < 6; i++) {
    p[i] = new PVector(200, 350 - 50 * i);
  }
}

void draw() {
  background(255);

  // 畫節點 + 線段 + 座標文字
  for (int i = 0; i < 6; i++) {
    if (i > 0) line(p[i - 1].x, p[i - 1].y, p[i].x, p[i].y);  // 畫線
    fill(255, 0, 0);  // 紅色圓點
    ellipse(p[i].x, p[i].y, 8, 8);
    fill(0);
    text("p:" + i, p[i].x + 10, p[i].y);
  }

  // 滑鼠現在的位置（目標點）
  PVector now = new PVector(mouseX, mouseY);

  // 計算 p[5] 要指向滑鼠的方向，但距離固定為 50（與 p[4] 間距）
  PVector v = PVector.sub(now, p[4]).normalize().mult(50);

  // 設定 p[5] 的新位置：從 p[4] 出發，往滑鼠方向延伸 50
  p[5].x = p[4].x + v.x;
  p[5].y = p[4].y + v.y;

  // 額外視覺標記滑鼠
  ellipse(mouseX, mouseY, 6, 6);  // 小點：滑鼠位置
  line(p[4].x, p[4].y, mouseX, mouseY);  // 虛線：p[4] → 滑鼠
}
