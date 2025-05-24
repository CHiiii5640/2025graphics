//week14_6_ik_inverse_kinematics_part4
// 使用向量運算讓 p[1] 向滑鼠靠近，但手臂長度限制為 50（單一骨架）

PVector[] p = new PVector[6];  // 最多6個點，目前用 p[0], p[1]

void setup() {
  size(400, 400);

  // 初始兩個點往上排
  for (int i = 0; i < 2; i++) {
    p[i] = new PVector(200, 350 - 50 * i);
  }
}

void draw() {
  background(255);

  // 畫出骨架線與節點
  for (int i = 0; i < 2; i++) {
    if (i > 0) line(p[i - 1].x, p[i - 1].y, p[i].x, p[i].y);

    fill(255, 0, 0);  // 紅色節點
    ellipse(p[i].x, p[i].y, 8, 8);

    fill(0);
    text("p:" + i, p[i].x + 10, p[i].y);  // 顯示點的編號
  }

  // 以下是 IK 的運算邏輯：
  // 目標位置是滑鼠
  PVector now = new PVector(mouseX, mouseY);

  // 算出從 p[0] 指向滑鼠的單位向量，並放大到 50 的長度（手臂長度）
  PVector v = PVector.sub(now, p[0]).normalize().mult(50);

  // 設定 p[1] 的位置為從 p[0] 延伸出去 50 長度的點
  p[1].x = p[0].x + v.x;
  p[1].y = p[0].y + v.y;

  // 額外畫出滑鼠點與引導線
  ellipse(mouseX, mouseY, 6, 6);  // 滑鼠位置點
  line(p[0].x, p[0].y, mouseX, mouseY);  // 從 p[0] 指向滑鼠的虛線
}
