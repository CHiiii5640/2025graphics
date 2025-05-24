//week14_1_PFont_createFont_textSize_text
// 學習如何使用 PFont 設定文字字型與大小，順便列出所有可用字型

size(300, 300);

// 先印出一個預設字型的文字
textSize(50);  // 設定字體大小為 50
text("Ha Ha Ha", 10, 50);  // 預設字型

// 建立 Times New Roman 字型（50號）
PFont font = createFont("Times New Roman", 50); 
textFont(font);  // 換字型
text("原來只是印字", 10, 100);  // 再印一次文字，稍微往下移

// 列出所有電腦支援的字型（forEach 寫法）
for (String name : PFont.list()) {
  println(name);
}
