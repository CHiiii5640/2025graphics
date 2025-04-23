//week09_6_save_saveStrings_loadStrings
void setup(){
  size(300, 300); // 開一個 300x300 的畫布
  rect(10, 10, 80, 80); // 畫一個方塊在左上角
  rect(110, 110, 80, 80); // 再畫一個方塊靠中間一點
  save("file.png"); 
  another = loadStrings("lines.txt"); // 嘗試去讀 lines.tet 這個文字檔，讀成功的話內容會變成陣列存在 another 裡
}

// 這邊是在定義一些變數
int x = 10, y = 10, ID = 0; // x 和 y 是畫方塊的位置，ID 是用來切換要畫哪一筆資料

// draw() 是畫面每一幀都會執行的東西
void draw(){
  background(204); // 每次重畫前，先清背景成灰色

  if(another != null){ // 如果有讀到檔案的話
    int [] now = int(split(another[ID], ' ')); // 把某一行（例如 "30 40"）切開變成數字陣列
    rect(now[0], now[1], 80, 80); // 根據檔案的座標畫一個方塊
    ID = (ID+1)% another.length; // 下一幀就換下一筆資料，輪流播放
  }

  rect(x, y, 80, 80); // 畫出你目前可以拖曳的那個方塊
}

// 這邊是當你拖動滑鼠的時候會發生的事
void mouseDragged(){
  x += mouseX - pmouseX; // 算出滑鼠移動的距離，更新方塊的位置
  y += mouseY - pmouseY;

  String now = x + " " + y; // 把目前的位置變成一串字串
  lines.add(now); // 加進去 ArrayList 裡（就是記錄每次拖曳的位置）
}

// 一開始就先開好一個 ArrayList，用來記錄拖曳後的座標
ArrayList<String> lines = new ArrayList<String>(); 

// another 是用來存檔案讀進來的資料（還沒讀進來時是 null）
String [] another;

// 按鍵事件
void keyPressed(){
  String[] arr = new String[lines.size()]; // 建一個跟 lines 一樣長的陣列
  lines.toArray(arr); // 把 ArrayList 的資料轉換成陣列

  if(key=='s') saveStrings("lines.txt", arr); // 如果你按下 s，就把這些位置存成文字檔 lines.txt
}
