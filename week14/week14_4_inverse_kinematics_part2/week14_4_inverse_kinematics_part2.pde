//week14_4_inverse_kinematics_part2
// 使用 angle[] 陣列儲存各關節角度，pushMatrix 進行轉動與連接

float[] angle = new float[5];  // 預留五個關節角度（目前用到 0 和 1）
int ID = 0;  // 目前控制的關節編號

void setup() {
  size(400, 400);
}

void draw() {
  background(255);           
  translate(200, 350);       // 把起點移到底部中間
  ellipse(0, 0, 12, 12);     // 畫基座圓點

  pushMatrix();
    rotate(radians(angle[0]));   // 第一節轉動
    rect(0, -5, 50, 10);         // 畫第一節手臂

    pushMatrix();
      translate(50, 0);          // 移動到第一節末端
      rotate(radians(angle[1])); // 第二節轉動
      rect(0, -5, 50, 10);       // 畫第二節手臂
    popMatrix();
    
  popMatrix();
}

void mouseDragged() {
  // 拖曳滑鼠改變目前選擇的那一節角度（用滑鼠水平位移決定改多少）
  angle[ID] += mouseX - pmouseX;
}

void keyPressed() {
  // 按 0 或 1 切換控制第幾節
  if (key == '0') ID = 0;
  if (key == '1') ID = 1;
}
