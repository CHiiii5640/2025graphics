//week14_9_ik_inverse_kinematics_part7
// 用滑鼠當目標點，讓多節骨架實現逆向運動學的正反推理

PVector[] p = new PVector[6];  // 六個節點（p[0]~p[5]）

void setup() {
  size(400, 400);
  // 初始化節點：從下往上排列
  for (int i = 0; i < 6; i++) {
    p[i] = new PVector(200, 350 - 50 * i);
  }
}

void draw() {
  background(255);

  // 畫骨架與節點
  for (int i = 0; i < 6; i++) {
    if (i > 0) line(p[i - 1].x, p[i - 1].y, p[i].x, p[i].y);  // 骨架線
    fill(255, 0, 0);
    ellipse(p[i].x, p[i].y, 8, 8);  // 節點
    fill(0);
    text("p:" + i, p[i].x + 10, p[i].y);  // 標記節點編號
  }

  // IK 運算
  
  // 1. 讓末端點跟隨滑鼠
  PVector now = new PVector(mouseX, mouseY);
  p[5].x = now.x;
  p[5].y = now.y;

  // 2. 從末端往回推（Backward）
  for (int i = 4; i >= 0; i--) {
    PVector v = PVector.sub(p[i + 1], p[i]).normalize().mult(50);  // 往回的單位向量 * 節距
    p[i].x = p[i + 1].x - v.x;
    p[i].y = p[i + 1].y - v.y;
  }

  // 3. 從基座往前推（Forward）
  p[0] = new PVector(200, 350);  // 固定根節點位置（p[0] 不動）
  for (int i = 1; i <= 5; i++) {
    PVector v = PVector.sub(p[i], p[i - 1]).normalize().mult(50);
    p[i].x = p[i - 1].x + v.x;
    p[i].y = p[i - 1].y + v.y;
  }

  // 滑鼠目標點視覺提示
  ellipse(mouseX, mouseY, 6, 6);
}
