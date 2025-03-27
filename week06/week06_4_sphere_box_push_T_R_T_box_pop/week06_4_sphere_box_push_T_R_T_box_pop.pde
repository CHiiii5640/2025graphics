//week06-4_sphere_box_push_T_R_T_box_pop
//慢慢組合出機械手臂
void setup(){
  size(500,400,P3D);
}
void draw(){
  background(255);//Step00
  translate(width/2,height/2);//Step00
  sphere(10);//Step04 放個圓球，當世界中心參考
  
  box(200,50,25);//手肘 Step05
  
  fill(252,131,77);
  pushMatrix();//Step03
    translate(x,y); //Step06
    if(mousePressed)
      rotateZ(radians(frameCount));//Step03
    translate(25,0,0);// Step02 往又推，讓左端放中心
    box(50,25,50);//Step01 小手腕
  popMatrix();//Step03
}
float x=0,y=0;//Step06 會動的位置
void mouseDragged(){ //Step06
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
  println("x:" +x +"y" +y); //Step07 印出來
}
