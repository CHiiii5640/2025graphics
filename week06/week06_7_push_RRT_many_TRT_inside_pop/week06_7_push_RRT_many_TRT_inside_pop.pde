//week06-7_push_RRT_many_TRT_inside_pop
//慢慢組合出機械手臂
void setup(){
  size(500,800,P3D);
}
void draw(){
  background(255);
  translate(width/2,height/2);
  sphere(10);
  
  fill(252,131,77);
  pushMatrix();
    if(mousePressed && mouseButton==RIGHT)
      rotateY(radians(frameCount));
    if(mousePressed && mouseButton==RIGHT)
      rotateZ(radians(frameCount));
    translate(0,-100);
    box(50,200,25);//Step03手臂

    pushMatrix();//Step04新的一組
      translate(0,-100);
      rotateZ(radians(frameCount));
      translate(100,0);//Step05新的轉動
      //Step03程式往又縮排
      box(200,50,25); //Step05手肘
      
      pushMatrix();//Step03程式往又縮排
        translate(100,0);//Stpe01把前一步發現的100,0放好
        rotateZ(radians(frameCount));//Step02把剛剛的if(mousePressed)刪掉
        translate(25,0,0);//Step02只轉動
        box(50,25,50);
      popMatrix();
     popMatrix();
   popMatrix();
}
float x=0,y=0;//Step06 會動的位置
void mouseDragged(){ //Step06
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
  println("x:" +x +"y" +y); //Step07 印出來
}
