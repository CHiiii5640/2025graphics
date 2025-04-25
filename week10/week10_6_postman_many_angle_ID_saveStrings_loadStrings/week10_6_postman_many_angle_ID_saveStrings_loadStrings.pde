//week10_6_postman_manyangle_ID_saveStrings_loadStrings
PImage head,postman,body,hand1,uparm1,hand2,uparm2;
float [] angle = new float[20];//20個關節變數
int ID = 0;//處理中關節ID
void mouseDragged(){
   angle[ID]+=mouseX-pmouseX; 
}
void keyPressed(){
    if(key=='1') ID = 1; // 左臂
    if(key=='2') ID = 2; // 左手
    if(key=='3') ID = 3; // 右臂
    if(key=='4') ID = 4; // 右手
    if(key=='5') ID = 5; // (待用)
    if(key=='6') ID = 6; // (待用)
    if(key=='0') ID = 0; // 頭
    

    if(key=='s'){//每按一次S就存一組ANGLE
      String now="";//要放現在全部關節的值
      for(int i=0;i<20;i++){
         now+=angle[i]+" "; //全部塞到now裡
      }
      lines.add(now);//現在的這行加到lines裡
      String[] arr= new String[lines.size()];
      lines.toArray(arr);
      saveStrings("angles.txt",arr);
    }
  if(key=='r'){//讀入
    if(R<lines.size()){
       float [] now=float(split(lines.get(R),' '));// 把字串拆成角度陣列
       for(int i=0;i<20;i++)  angle[i]=now[i];// 套用到每個角度
       R=(R+1)%lines.size();
    }
   }  
}
int R=0;// 回放用的索引
ArrayList<String> lines = new ArrayList<String>();//放移動結果 
void setup(){
  size(560,560);
  postman= loadImage("postman.png");
  head =loadImage("head.png");
  body =loadImage("body.png");
  uparm1=loadImage("uparm1.png");
  hand1=loadImage("hand1.png");
  uparm2=loadImage("uparm2.png");
  hand2=loadImage("hand2.png");
}
void draw(){// 每一幀會自動畫一次（畫出角色與角度）
  background(#FFFFF2);
  image(postman,0,0);
  fill(255,0,255,128);
  rect(0,0,560,560);
  // 左手臂（上臂＋手）
  pushMatrix();
    translate(185,261);
    rotate(radians(angle[1]));
    translate(-185,-261);
    image(uparm1,0,0);
    pushMatrix();
      translate(116,265);
      rotate(radians(angle[2]));
      translate(-116,-265);
      image(hand1,0,0);
    popMatrix();
  popMatrix();
  // 右手臂（上臂＋手）
  pushMatrix();
    translate(290,262);
    rotate(radians(angle[3]));
    translate(-290,-262);
    image(uparm2,0,0);
    pushMatrix();
      translate(357,259);
      rotate(radians(angle[4]));
      translate(-357,-259);
      image(hand2,0,0);
    popMatrix();
  popMatrix();
  // 頭部
  pushMatrix();
    translate(236,231);//再放回去正確位置
    rotate(radians(angle[0]));
    translate(-236,-231);//把頭的旋轉中心放到(0,0)
    image(head,0,0);
  popMatrix();
  image(body,0,0);
}        
