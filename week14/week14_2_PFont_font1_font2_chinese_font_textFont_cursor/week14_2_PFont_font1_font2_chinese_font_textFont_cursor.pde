//week14_2_PFont_font1_font2_chinese_font_textFont_cursor
// 展示三種字型效果，包含 Times、微軟正黑體、精靈字體，配合滑鼠移動

PFont font1, font2, font3;
void setup() {
  size(350, 350);

  // 英文字型（有粗體＋斜體）
  font1 = createFont("Times New Roman Bold Italic", 50);

  // 中文字型（微軟正黑體）
  font2 = createFont("微軟正黑體 Bold", 50);

  // 注音用的精靈字型，把字型檔拉進程式
  font3 = createFont("elffont-rock.otf", 50);
}

void draw() {
  background(0);  
  cursor(CROSS);  // 滑鼠游標改十字形
  fill(255);      // 白字

  textFont(font1);  // 英文 Times 字型
  text("NO Hello 中文", mouseX, mouseY - 20);  // 跟著滑鼠移動

  fill(#FF8E8E);    // 粉紅色
  textFont(font2);  // 微軟正黑體
  text("YES Hello 中文", mouseX, mouseY + 50);  // 底下再印一次

  textFont(font3);  // 精靈字體（支援注音）
  text("ㄓㄕㄌㄍ", mouseX + 20, mouseY + 100);  // 注音往右下印 正聖老哥
}
