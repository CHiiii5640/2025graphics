//week14_8_ik_inverse_kinematics_part6
// 從 p[5] 到 p[1]，逐節反向計算位置，距離固定為 50，末端跟隨滑鼠

PVector[] p = new PVector[6];  // 六個節點（p[0]~p[5]）

void setup() {
  size(400, 400);

  // 一開始每個點從底下往上排，間隔 50px
  for (int i = 0; i < 6; i++) {
    p[i] = new PVector(200, 350 - 50 * i);
  }
}

void draw() {
  background(255);

  // 畫每一節節點與連線
  for (int i = 0; i < 6; i++) {
    if (i > 0) line(p[i - 1].x, p[i - 1].y, p[i].x, p[i].y);  // 連線
    fill(255, 0, 0);  // 紅色節點
    ellipse(p[i].x, p[i].y, 8, 8);
    fill(0);  // 黑色文字
    text("p:" + i, p[i].x + 10, p[i].y);
  }

  // 設定滑鼠當作目標點
  PVector now = new PVector(mouseX, mouseY);

  // 反向迴圈：從末端 p[5] 開始，一節一節往前推回
  for (int i = 5; i > 0; i--) {
    PVector v = PVector.sub(now, p[i]);   // 現在點指向目標的向量
    v.normalize().mult(50);               // 單位向量拉長成手臂長度
    p[i].x = now.x - v.x;                 // 反推位置回來（尾往前）
    p[i].y = now.y - v.y;
    now = p[i];                           // 下一節以這節為目標
  }

  // 滑鼠目標點視覺提示
  ellipse(mouseX, mouseY, 6, 6);
}
