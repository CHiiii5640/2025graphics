  //week14_9b_ik_inverse_kinematics_part8
  // 模擬多節柔性骨架，實作 IK 反向+前向調整，滑鼠控制末端
  
  int N = 20; // 節點數
  int L = 300 / N; // 每節長度（平均分配）
  PVector[] p = new PVector[N];
  
  void setup() {
    size(400, 400);
  
    // 初始化：每個節點往上疊
    for (int i = 0; i < N; i++) {
      p[i] = new PVector(200, 350 - L * i);
    }
  }
  
  void draw() {
    background(255);
  
    // 畫每個節點和連線
    for (int i = 0; i < N; i++) {
      if (i > 0) line(p[i - 1].x, p[i - 1].y, p[i].x, p[i].y);  // 骨架線
      fill(255, 0, 0);
      ellipse(p[i].x, p[i].y, 8, 8);  // 節點圓
      fill(0);
      text("p:" + i, p[i].x + 10, p[i].y);  // 編號
    }
  
    // 滑鼠位置變成 p[N-1]（末端點）
    p[N - 1].x = mouseX;
    p[N - 1].y = mouseY;
  
    // 從末端往回推（Backward）
    for (int i = N - 2; i > 0; i--) {
      PVector v = PVector.sub(p[i + 1], p[i]).normalize().mult(L);
      p[i].x = p[i + 1].x - v.x;
      p[i].y = p[i + 1].y - v.y;
    }
  
    // 從根節往前推（Forward），固定 p[0]
    for (int i = 1; i < N; i++) {
      PVector v = PVector.sub(p[i], p[i - 1]).normalize().mult(L);
      p[i].x = p[i - 1].x + v.x;
      p[i].y = p[i - 1].y + v.y;
    }
  
    // 顯示滑鼠小點
    ellipse(mouseX, mouseY, 6, 6);
  }
