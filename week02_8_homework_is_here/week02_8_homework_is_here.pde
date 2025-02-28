//week02-8_homework_is_here
//要把畫出來東西 變成座標
ArrayList<Integer> x,y; //先有2個 [還沒準備好]的(小的)資料結構 等mousePressed再新增資料結構
ArrayList<ArrayList<Integer>>xx=new ArrayList<ArrayList<Integer> >(); //大的資料結構
ArrayList<ArrayList<Integer>>yy=new ArrayList<ArrayList<Integer> >();

PImage img;
void setup(){
  size(400,400);
  img=loadImage("usagi.jpg");
}
void draw(){
  background(img);
  fill(255,200);//半透明色彩(白色)
  rect(0,0,400,400);//畫一個四邊形蓋住

 for(int I=0;I<xx.size();I++){ //大寫I對應大的資料結構
     ArrayList<Integer> x=xx.get(I); //取出小資料結構
     ArrayList<Integer> y=yy.get(I);
     for(int i=1;i<x.size();i++){ //小的 繼續畫
       line(x.get(i),y.get(i),x.get(i-1),y.get(i-1));
     }
   }
   noFill();
   strokeWeight(5);
   draw1();
}
void keyPressed(){
  if(key=='S' || key=='s'){ //按下大小寫S s鍵存檔
     for(int I=0;I<xx.size();I++){ //大寫I對應大的資料結構
       ArrayList<Integer> x=xx.get(I); //取出小資料結構
       ArrayList<Integer> y=yy.get(I);
       println("beginShape();");
       for(int i=1;i<x.size();i++){ //小的 繼續畫
         println("  vertex("+ x.get(i)+", "+y.get(i)+");");
       } //改在keyPressed()按下S或s，再全部印 
       println("endShape();");
     }
  }
}
void mouseDragged(){
    //println("vertex(mouseX,mouseY);");
    // println("vertex("+mouseX +", "+ mouseY+ ");");
    x.add(mouseX);
    y.add(mouseY);
 }
void mousePressed(){ //滑鼠按下 創建新的資料結構
  x=new ArrayList<Integer>();xx.add(x);
  y=new ArrayList<Integer>();yy.add(y);
}
void draw1(){
beginShape();
  vertex(266, 284);
  vertex(265, 284);
  vertex(264, 284);
  vertex(263, 284);
  vertex(262, 284);
  vertex(261, 284);
  vertex(259, 284);
  vertex(258, 285);
  vertex(257, 285);
  vertex(256, 285);
  vertex(255, 285);
  vertex(254, 285);
  vertex(253, 285);
  vertex(252, 286);
  vertex(251, 287);
  vertex(250, 287);
  vertex(249, 288);
  vertex(248, 289);
  vertex(247, 290);
  vertex(247, 291);
  vertex(247, 292);
  vertex(247, 293);
  vertex(247, 294);
  vertex(247, 295);
  vertex(247, 296);
  vertex(247, 297);
  vertex(247, 298);
  vertex(248, 300);
  vertex(249, 301);
  vertex(249, 302);
  vertex(250, 303);
  vertex(251, 303);
  vertex(251, 304);
  vertex(252, 304);
  vertex(253, 304);
  vertex(254, 304);
  vertex(255, 304);
  vertex(256, 304);
  vertex(257, 304);
  vertex(258, 304);
  vertex(259, 304);
  vertex(260, 304);
  vertex(261, 304);
  vertex(262, 304);
  vertex(263, 304);
  vertex(264, 304);
  vertex(265, 304);
  vertex(266, 304);
  vertex(267, 304);
  vertex(267, 305);
  vertex(268, 305);
endShape();
beginShape();
  vertex(297, 306);
  vertex(298, 305);
  vertex(298, 304);
  vertex(299, 304);
  vertex(299, 303);
  vertex(299, 302);
  vertex(300, 300);
  vertex(300, 299);
endShape();
beginShape();
  vertex(304, 317);
  vertex(305, 317);
  vertex(306, 317);
  vertex(307, 317);
  vertex(307, 316);
  vertex(308, 316);
  vertex(309, 316);
  vertex(310, 315);
  vertex(312, 315);
  vertex(313, 314);
  vertex(314, 314);
  vertex(315, 314);
  vertex(316, 314);
  vertex(317, 314);
  vertex(318, 314);
  vertex(319, 314);
  vertex(320, 313);
  vertex(321, 313);
endShape();
beginShape();
  vertex(309, 331);
  vertex(310, 331);
  vertex(311, 332);
  vertex(312, 332);
  vertex(313, 333);
  vertex(314, 333);
  vertex(315, 333);
  vertex(315, 334);
  vertex(316, 334);
  vertex(317, 335);
  vertex(318, 335);
  vertex(319, 336);
endShape();
beginShape();
  vertex(299, 346);
  vertex(300, 347);
  vertex(300, 348);
  vertex(300, 349);
  vertex(300, 350);
  vertex(300, 351);
  vertex(301, 351);
  vertex(301, 352);
  vertex(301, 353);
  vertex(301, 354);
  vertex(302, 354);
  vertex(302, 355);
  vertex(302, 356);
  vertex(302, 357);
  vertex(302, 358);
  vertex(302, 359);
  vertex(302, 360);
endShape();
beginShape();
  vertex(289, 349);
  vertex(289, 350);
  vertex(289, 352);
  vertex(289, 353);
  vertex(289, 354);
  vertex(288, 355);
  vertex(288, 356);
  vertex(287, 359);
  vertex(287, 361);
  vertex(286, 362);
  vertex(286, 364);
  vertex(286, 365);
  vertex(286, 366);
  vertex(286, 367);
  vertex(285, 367);
  vertex(285, 366);
endShape();
beginShape();
  vertex(273, 349);
  vertex(273, 350);
  vertex(273, 351);
  vertex(273, 352);
  vertex(273, 353);
  vertex(273, 354);
  vertex(273, 355);
  vertex(273, 356);
  vertex(273, 357);
  vertex(273, 358);
endShape();

}
