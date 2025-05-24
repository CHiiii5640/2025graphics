//week14_5_ik_inverse_kinematics_part3
// 使用 PVector 陣列儲存多個節點，畫線連接，並讓滑鼠連一條線出去

PVector[] p = new PVector[6];  // 最多 6 個頂點（目前用到前 2 個）

void setup() {
  size(400, 400);

  // 設定初始頂點座標：兩個點從下往上排，每隔 50 px
  for (int i = 0; i < 2; i++) {
    p[i] = new PVector(200, 350 - 50 * i);
  }
}

void draw() {
  background(255); 
  for (int i = 0; i < 2; i++) {
    // 如果不是第一個點，就畫線連前一個點
    if (i > 0) {
      line(p[i - 1].x, p[i - 1].y, p[i].x, p[i].y);
    }

    // 紅色小圓圈表示頂點位置
    fill(255, 0, 0);
    ellipse(p[i].x, p[i].y, 8, 8);

    // 黑字顯示編號
    fill(0);
    text("p:" + i, p[i].x + 10, p[i].y);
  }

  // 畫出滑鼠位置的小點（藍色）
  ellipse(mouseX, mouseY, 6, 6);
  
  // 從 p[0] 拉一條線到滑鼠（模擬手臂指向目標）
  line(p[0].x, p[0].y, mouseX, mouseY);
}
