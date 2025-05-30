// week15_06_postman_mouseDragged_posX_posY_ID_angleX_ID_atan2
// 修改 week15_05_postman_mouseDragged_head_angleX_0_atan2
// 重構程式架構：支援多關節控制（頭、手、腳），加入X/Y旋轉與動畫儲存播放功能

// ===== 1. 全域變數宣告區 =====

PImage postman, head, body, hand1, uparm1, hand2, uparm2, foot1, foot2;

float[] angleX = new float[10]; // 水平旋轉角度（X軸）
float[] angleY = new float[10]; // 垂直旋轉角度（Y軸，目前未應用）

int ID = 0; // 當前控制的關節編號
int R = 0; // 動畫播放的當前幀索引
boolean playing = false; // 是否播放動畫

ArrayList<String> lines = new ArrayList<String>(); // 所有儲存的動畫幀

// ===== 2. 初始化與圖像載入 =====

void setup() {
  size(560, 560); // 畫面尺寸

  // 載入圖檔
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  hand1 = loadImage("hand1.png");
  uparm1 = loadImage("uparm1.png");
  hand2 = loadImage("hand2.png");
  uparm2 = loadImage("uparm2.png");
  foot1 = loadImage("foot1.png"); // 左腳
  foot2 = loadImage("foot2.png"); // 右腳
}

// ===== 3. 主繪圖邏輯 =====

void draw() {
  background(#FFFFF2); // 背景

  if (playing) myInterpolate(); // 若啟動播放，執行內插動畫

  image(body, 0, 0); // 畫身體（固定）

  // 畫頭部（旋轉）
  pushMatrix();
    translate(236, 231);
    rotate(radians(angleX[0]));
    translate(-236, -231);
    image(head, 0, 0);
  popMatrix();

  // 畫左腳
  pushMatrix();
    translate(220, 375);
    rotate(radians(angleX[5]));
    translate(-220, -375);
    image(foot1, 0, 0);
  popMatrix();

  // 畫右腳
  pushMatrix();
    translate(260, 372);
    rotate(radians(angleX[6]));
    translate(-260, -372);
    image(foot2, 0, 0);
  popMatrix();

  // 畫左臂（上臂 + 手）
  pushMatrix();
    translate(184, 263);
    rotate(radians(angleX[1]));
    translate(-184, -263);
    image(uparm1, 0, 0);
    pushMatrix();
      translate(116, 265);
      rotate(radians(angleX[2]));
      translate(-116, -265);
      image(hand1, 0, 0);
    popMatrix();
  popMatrix();

  // 畫右臂（上臂 + 手）
  pushMatrix();
    translate(290, 262);
    rotate(radians(angleX[3]));
    translate(-290, -262);
    image(uparm2, 0, 0);
    pushMatrix();
      translate(357, 259);
      rotate(radians(angleX[4]));
      translate(-357, -259);
      image(hand2, 0, 0);
    popMatrix();
  popMatrix();
}

// ===== 4. 滑鼠控制角度 =====
float [] posX = {236, 185, 116, 290, 357, 220, 260}; // void draw()
float [] posY = {231, 261, 265, 262, 259, 375, 372}; //全部的座標
float []posAngle = {90, 180, 180, 0, 0, -90, -90};
void mouseDragged() {
  // 要把原本 mosueX 的左右移動，改成像 IK 轉動
  // 從 void draw() 找到頭 掛的位置
  // float dx = mouseX - 236; // 減掉座標
  // float dy = mouseY - 231; // 減掉座標
  // angleX[0] = degrees(atan2(dy, dx)) + 90; // 頭的角度
  
  float dx = mouseX - posX[ID]; // 減掉座標
  float dy = mouseY - posY[ID]; // 減掉座標
  angleX[ID] = degrees(atan2(dy,dx)) + posAngle[ID]; // 減掉某個關節的角度
  
  // angleX[ID] += mouseX - pmouseX;
  // angleY[ID] += mouseY - pmouseY; // 尚未應用，可擴充為 3D 使用
}

// ===== 5. 鍵盤互動控制 =====

void keyPressed() {
  //  儲存目前所有關節角度
  if (key == 's') {
    String now = "";
    for (int i = 0; i < 10; i++) {
      now += angleX[i] + " " + angleY[i] + " ";
    }
    lines.add(now);
    saveStrings("angles.txt", lines.toArray(new String[0]));
    println("現在存檔: " + now);
  }

  //  讀取儲存的角度資料
  if (key == 'r') {
    String[] file = loadStrings("angles.txt");
    if (file != null) {
      for (String line : file) {
        lines.add(line);
        println("現在讀檔: " + line);
      }
    }
  }

  //  開關動畫播放
  if (key == 'p') playing = !playing;

  //  選擇控制關節 ID（0~6）
  if (key == '0') ID = 0; // 頭
  if (key == '1') ID = 1; // 左臂
  if (key == '2') ID = 2; // 左手
  if (key == '3') ID = 3; // 右臂
  if (key == '4') ID = 4; // 右手
  if (key == '5') ID = 5; // 左腳
  if (key == '6') ID = 6; // 右腳
}

// ===== 6. 內插動畫函式（平滑播放） =====

void myInterpolate() {
  if (lines.size() >= 2) {
    float alpha = (frameCount % 30) / 30.0;
    if (alpha == 0.0) R = (R + 1) % lines.size();
    int R2 = (R + 1) % lines.size();

    float[] oldAngle = float(split(lines.get(R), ' '));
    float[] newAngle = float(split(lines.get(R2), ' '));

    for (int i = 0; i < 10; i++) {
      angleX[i] = oldAngle[i * 2] * (1 - alpha) + newAngle[i * 2] * alpha;
      angleY[i] = oldAngle[i * 2 + 1] * (1 - alpha) + newAngle[i * 2 + 1] * alpha;
    }
  }
}
