// week11-2_postman_alpha_interpolation
// 頭 身體 手臂 手軸 腳
// 加入了內插動畫功能，使用 p 鍵執行當前幀與下一幀的平滑過渡

// 載入郵差角色的各個部位圖片
PImage postman, head, body, hand1, uparm1, hand2, uparm2;

float[] angle = new float[20];// 準備 20 個關節角度變數
int ID = 0;// 現在正在操作的關節編號（用來配合 angle 陣列）
void mouseDragged() {// 滑鼠拖曳時，根據 X 軸移動距離來調整目前選取的關節角度
  angle[ID] += mouseX - pmouseX;
}

void keyPressed() {
  // 指定當前操作的關節 ID（透過鍵盤按鍵）
  if (key == '1') ID = 1; // 左上臂
  if (key == '2') ID = 2; // 左手
  if (key == '3') ID = 3; // 右上臂
  if (key == '4') ID = 4; // 右手
  if (key == '5') ID = 5; // 保留
  if (key == '6') ID = 6; // 保留
  if (key == '0') ID = 0; // 頭部

  // 按下 s 鍵：將目前所有關節角度儲存為一筆資料，存入文字檔
  if (key == 's') {
    String now = "";
    for (int i = 0; i < 20; i++) {
      now += angle[i] + " "; // 用空格分隔每個角度
    }
    lines.add(now); // 加入角度序列
    String[] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt", arr); // 寫入 angles.txt
  }

  // 按下 r 鍵：讀取 angles.txt 並逐幀重播關節角度
  if (key == 'r') {
    if (R == 0) {
      String[] file = loadStrings("angles.txt"); // 載入所有儲存的資料
      if (file != null) {
        for (int i = 0; i < file.length; i++) {
          lines.add(file[i]);
        }
      }
    }
    if (R < lines.size()) {
      float[] now = float(split(lines.get(R), ' ')); // 取得第 R 幀的角度
      for (int i = 0; i < 20; i++) {
        angle[i] = now[i]; // 套用角度
      }
      R = (R + 1) % lines.size(); // 下一幀（循環）
    }
  }

  // 按下 p 鍵：執行兩幀之間的線性內插，產生平滑動畫過渡效果
  if (key == 'p') {
    // 取得當前幀與下一幀的角度陣列
    float[] oldAngle = float(split(lines.get(R), ' '));
    float[] newAngle = float(split(lines.get((R + 1) % lines.size()), ' '));
    
    // 根據 frameCount 動態產生內插比例 alpha，範圍為 0 ~ 1
    float alpha = (frameCount % 30) / 30.0;

    // 執行線性內插公式：angle = A*(1-alpha) + B*alpha
    for (int i = 0; i < 20; i++) {
      angle[i] = oldAngle[i] * (1 - alpha) + newAngle[i] * alpha;
    }
  }
}

// 用來記錄重播當前播放到第幾幀
int R = 0;

// 儲存所有角度的動畫序列（每行一幀）
ArrayList<String> lines = new ArrayList<String>();

// 初始化畫面與載入圖像
void setup() {
  size(560, 560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  hand1 = loadImage("hand1.png");
  uparm1 = loadImage("uparm1.png");
  hand2 = loadImage("hand2.png");
  uparm2 = loadImage("uparm2.png");
}

// 每一幀畫面重新繪製角色組合（依照 angle[] 角度變化）
void draw() {
  background(#FFFFF2); // 背景顏色

  image(postman, 0, 0); // 畫基礎郵差圖像（非關節部分）

  fill(255, 0, 255, 128); // 紫色半透明濾鏡
  rect(0, 0, 560, 560); // 畫上濾鏡

  // 左手臂（上臂 + 手）
  pushMatrix();
    translate(184, 263); // 左上臂旋轉中心
    rotate(radians(angle[1]));
    translate(-184, -263);
    image(uparm1, 0, 0); // 畫左上臂

    pushMatrix();
      translate(116, 265); // 左手旋轉中心
      rotate(radians(angle[2]));
      translate(-116, -265);
      image(hand1, 0, 0); // 畫左手
    popMatrix();
  popMatrix();

  // 右手臂（上臂 + 手）
  pushMatrix();
    translate(290, 262); // 右上臂旋轉中心
    rotate(radians(angle[3]));
    translate(-290, -262);
    image(uparm2, 0, 0); // 畫右上臂

    pushMatrix();
      translate(357, 259); // 右手旋轉中心
      rotate(radians(angle[4]));
      translate(-357, -259);
      image(hand2, 0, 0); // 畫右手
    popMatrix();
  popMatrix();

  // 頭部（可旋轉）
  pushMatrix();
    translate(236, 231); // 頭部旋轉中心
    rotate(radians(angle[0]));
    translate(-236, -231);
    image(head, 0, 0); // 畫頭部
  popMatrix();

  // 身體（固定不轉動）
  image(body, 0, 0);
}
