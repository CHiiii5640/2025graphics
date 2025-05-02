// week11-2_postman_alpha_interpolation_better
// 頭、身體、手臂、手軸、腳的動畫控制與儲存系統（加上自動內插）

PImage postman, head, body, hand1, uparm1, hand2, uparm2;
float[] angle = new float[20];// 儲存每個關節角度的陣列，最多 20 個關節
int ID = 0;// 目前正在控制的關節 ID（用鍵盤切換）

void mouseDragged() {// 滑鼠拖曳時改變當前關節的角度，透過 X 軸滑動來調整
  angle[ID] += mouseX - pmouseX;
}

void keyPressed() {
  // 使用鍵盤 0~4 來選擇控制哪個關節
  if (key == '1') ID = 1; // 左上臂
  if (key == '2') ID = 2; // 左手
  if (key == '3') ID = 3; // 右上臂
  if (key == '4') ID = 4; // 右手
  if (key == '5') ID = 5; // 保留用
  if (key == '6') ID = 6; // 保留用
  if (key == '0') ID = 0; // 頭部

  // 按下 's' 鍵時，將目前所有關節角度存入文字檔 angles.txt
  if (key == 's') {
    String now = ""; // 存儲一行角度的字串
    for (int i = 0; i < 20; i++) {
      now += angle[i] + " "; // 將所有角度接成一行（空格分隔）
    }
    lines.add(now); // 加入目前角度到 lines 陣列
    String[] arr = new String[lines.size()];
    lines.toArray(arr); // 轉為 String 陣列以便儲存
    saveStrings("angles.txt", arr); // 儲存到文字檔
  }

  // 按下 'r' 鍵時，從文字檔讀入儲存的角度並開始播放
  if (key == 'r') {
    if (R == 0) {
      String[] file = loadStrings("angles.txt"); // 載入檔案內容
      if (file != null) {
        for (int i = 0; i < file.length; i++) {
          lines.add(file[i]); // 把每一行加入 lines
        }
      }
    }

    // 每次按下 r 會播放一幀
    if (R < lines.size()) {
      float[] now = float(split(lines.get(R), ' ')); // 解析該行角度
      for (int i = 0; i < 20; i++) {
        angle[i] = now[i]; // 套用該幀角度
      }
      R = (R + 1) % lines.size(); // 前進到下一幀（循環播放）
    }
  }

  // 註：原本的 p 鍵內插功能被改成 myInterpolate()，自動播放
}

// 控制目前播放的幀位置（R = Replay Index）
int R = 0;

// 儲存所有角度資料的陣列，每一筆為一幀動畫
ArrayList<String> lines = new ArrayList<String>();

// 當前自動播放使用的動畫內插函式
void myInterpolate() {
  if (lines.size() > 0) {
    // 取得插值用比例 alpha（隨 frameCount 漸變）
    float alpha = (frameCount % 30) / 30.0;

    // 每 30 幀換一次幀
    if (alpha == 0.0) R = (R + 1) % lines.size();

    int R2 = (R + 1) % lines.size(); // 下一幀編號

    // 取出目前幀與下一幀的角度
    float[] oldAngle = float(split(lines.get(R), ' '));
    float[] newAngle = float(split(lines.get(R2), ' '));

    // 執行線性插值公式：old*(1-alpha) + new*alpha
    for (int i = 0; i < 20; i++) {
      angle[i] = oldAngle[i] * (1 - alpha) + newAngle[i] * alpha;
    }
  }
}

// 設定畫面大小與載入圖片
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

// 主繪圖函式，每一幀都會執行一次
void draw() {
  myInterpolate(); // 每一幀執行自動內插動畫

  background(#FFFFF2); // 淺黃色背景
  image(postman, 0, 0); // 畫出整體輪廓
  fill(255, 0, 255, 128); // 半透明紫色濾鏡
  rect(0, 0, 560, 560); // 疊加濾鏡

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
    image(head, 0, 0); // 畫頭
  popMatrix();

  // 畫出身體（不旋轉）
  image(body, 0, 0);
}
