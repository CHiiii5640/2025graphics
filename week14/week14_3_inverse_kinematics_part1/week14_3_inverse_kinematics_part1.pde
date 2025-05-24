//week14_3_inverse_kinematics_part1
// 使用 pushMatrix/rotate 模擬關節轉動，未來可擴展為多節手臂

void setup() {
  size(400, 400);  // 使用 2D 模式
}

float[] angle = new float[5];  // 五個關節用的角度陣列（目前只用到 angle[0]）

void draw() {
  background(255);            
  translate(200, 350);        // 把基底移到底部中央
  ellipse(0, 0, 12, 12);      // 畫個基底圓點當作固定端

  pushMatrix();               // 儲存目前座標狀態
    rotate(radians(angle[0]));  // 對 Z 軸旋轉 angle[0] 度（2D 模式下就是平面旋轉）
    rect(0, -5, 50, 10);        // 畫手臂（水平長條）
  popMatrix();                // 還原座標狀態
}

void mouseDragged() {
  // 滑鼠拖曳時，根據 X 軸移動改變第一節手臂角度
  angle[0] += mouseX - pmouseX;
}
