//week11-1-postman-saveString-loadString
//頭 身體 手臂 手轴 腳
//改自week10_6_postman_many_angle_ID_saveStrings_loadStrings

// 載入郵差角色的各個部位圖片
PImage postman, head, body, hand1, uparm1, hand2, uparm2;
float [] angle = new float[20];// 準備 20 個關節角度變數
int ID = 0;// 現在正在操作的關節編號（用來配合 angle 陣列）
void mouseDragged() {// 滑鼠拖曳時，根據 X 軸移動距離來調整當前選取的關節角度
  angle[ID] += mouseX - pmouseX;
}

void keyPressed() {
  // 指定當前操作的關節 ID
  if(key == '1') ID = 1; // 左邊上臂
  if(key == '2') ID = 2; // 左邊手
  if(key == '3') ID = 3; // 右邊上臂
  if(key == '4') ID = 4; // 右邊手
  if(key == '5') ID = 5; // 保留用
  if(key == '6') ID = 6; // 保留用
  if(key == '0') ID = 0; // 頭部

  // 按下 s 鍵：儲存當前所有角度為一組資料，寫入 angles.txt
  if(key == 's') {
    String now = ""; // 儲存目前 20 個角度的字串
    for(int i = 0; i < 20; i++) {
      now += angle[i] + " "; // 把每個角度串接起來
    }
    lines.add(now); // 加入到 lines 陣列中
    String[] arr = new String[lines.size()];
    lines.toArray(arr); // 轉為字串陣列
    saveStrings("angles.txt", arr); // 寫入檔案
  }

  // 按下 r 鍵：重播從檔案讀入的角度資料
  if(key == 'r') {
    if(R == 0) {
      // 第一次重播時，先從檔案讀取所有儲存的角度資料
      String[] file = loadStrings("angles.txt");
      if(file != null) {
        for(int i = 0; i < file.length; i++) {
          lines.add(file[i]);
        }
      }
    }
    // 依序將角度值套用到 angle 陣列中，進行動畫重播
    if(R < lines.size()) {
      float[] now = float(split(lines.get(R), ' ')); 
      for(int i = 0; i < 20; i++) {
        angle[i] = now[i];
      }
      R = (R + 1) % lines.size(); // 播完回到開頭（循環播放）
    }
  }
}
// 重播控制用的指標
int R = 0;
// 儲存所有角度動作的序列（每筆為一幀）
ArrayList<String> lines = new ArrayList<String>();

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

// draw()：每幀重畫畫面
void draw() {
  background(#FFFFF2); // 背景色

  image(postman, 0, 0); // 畫出初始角色背景圖

  fill(255, 0, 255, 128); // 半透明紫色濾鏡
  rect(0, 0, 560, 560); // 蓋上透明層，用於對比動畫部件

  // 畫出左邊手臂（上臂 + 手）
  pushMatrix();
    translate(184, 263); // 設定左上臂旋轉中心
    rotate(radians(angle[1]));
    translate(-184, -263);
    image(uparm1, 0, 0); // 左上臂

    pushMatrix();
      translate(116, 265); // 設定左手旋轉中心
      rotate(radians(angle[2]));
      translate(-116, -265);
      image(hand1, 0, 0); // 左手
    popMatrix();
  popMatrix();

  // 畫出右邊手臂（上臂 + 手）
  pushMatrix();
    translate(290, 262); // 右上臂旋轉中心
    rotate(radians(angle[3]));
    translate(-290, -262);
    image(uparm2, 0, 0); // 右上臂

    pushMatrix();
      translate(357, 259); // 右手旋轉中心
      rotate(radians(angle[4]));
      translate(-357, -259);
      image(hand2, 0, 0); // 右手
    popMatrix();
  popMatrix();

  // 畫出頭部（可旋轉）
  pushMatrix();
    translate(236, 231); // 頭部旋轉中心
    rotate(radians(angle[0]));
    translate(-236, -231);
    image(head, 0, 0); // 頭部圖像
  popMatrix();

  // 畫出身體（固定不轉動）
  image(body, 0, 0);
}
