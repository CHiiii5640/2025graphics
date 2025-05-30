//week12-1_gundam_head_body_uparm_upuparm_hand
//修改自week09-2_gundam_head_body_push_trt_pop
//加上week09_5_gundam_uparm_upuparm_hand_keyboard_mouse_angle
PShape body,head;
PShape uparm1,upuparm1,hand1; //week09-5
PShape uparm2,upuparm2,hand2; //week12-5

void setup(){
  size(400,400,P3D);
  body=loadShape("body.obj");
  head=loadShape("head.obj");
  uparm1=loadShape("uparm1.obj");//week09-5
  upuparm1=loadShape("upuparm1.obj");//week09-5
  hand1=loadShape("hand1.obj");//week09-5
  uparm2=loadShape("uparm2.obj");//week12-5
  upuparm2=loadShape("upuparm2.obj");//week12-5
  hand2=loadShape("hand2.obj");//week12-5
}


float [] angleX = new float[10];
float [] angleY = new float[10];
int ID = 0; // 0:head, 1: upuparm, 2:uparm, 3:hand

void mouseDragged(){
  angleX[ID] += radians(mouseX - pmouseX); //左右拖曳
  angleY[ID] += radians(mouseY - pmouseY); //上下拖曳
}

void keyPressed(){
  if(key == '1') ID = 1; //upuparm
  if(key == '2') ID = 2; //uparm
  if(key == '3') ID = 3; // hand
  if(key == '4') ID = 4;
  if(key == '5') ID = 5;
  if(key == '6') ID = 6;
  if(key == '7') ID = 7;
  if(key == '8') ID = 8;
  if(key == '9') ID = 9;
  if(key == '0') ID = 0; //head
}
void draw(){
  background(204);
  translate(200,300);
  sphere(10);
  
  scale(10,-10,10);
  shape(body,0,0);
  pushMatrix();
    translate(0,22.5);
    rotateY(angleX[0]); // X方向 左右拖曳，對Y軸轉 
    rotateX(angleY[0]); // Y方向 上下拖曳，對X軸轉
    translate(0,-22.5);
    shape(head,0,0);
  popMatrix();
  
  pushMatrix();
    translate(-2.9,20.7);
    rotateY(angleX[1]);
    rotateX(angleY[1]);
    translate(2.9,-20.7);
    //用下面兩行 找到旋轉中心的座標 印出來
    //translate(mouseX/10.0,-mouseY/10.0);
    //println(mouseX/10.0,-mouseY/10.0);
    shape(upuparm1,0,0);
    pushMatrix();
       translate(-4.1,19.9);
       //rotateZ(radians(mouseX));
       rotateZ(angleY[2]);
       rotateY(angleX[2]);
       translate(4.1,-19.9);
     /* 
      translate(mouseX/10.0,-mouseY/10.0);//移動找到數值
      println(mouseX/10.0,-mouseY/10.0);//印出數值 4.1,-19.9
      */
       shape(uparm1,0,0);
       pushMatrix();
         translate(-4.5,16.9);
         //rotateX(radians(mouseX));
         rotateX(angleY[3]);
         rotateY(angleX[3]);
         translate(4.5,-16.9);
         //translate(mouseX/10.0,-mouseY/10.0);
         //println(mouseX/10.0,-mouseY/10.0);
         shape(hand1,0,0);
       popMatrix();
    popMatrix();
   popMatrix();
   
   pushMatrix();
    translate(2.9,20.7);
    rotateY(angleX[4]);
    rotateX(angleY[4]);
    translate(-2.9,-20.7);
    //用下面兩行 找到旋轉中心的座標 印出來
    //translate(mouseX/10.0,-mouseY/10.0);
    //println(mouseX/10.0,-mouseY/10.0);
    shape(upuparm2,0,0);
    pushMatrix();
       translate(4.1,19.9);
       //rotateZ(radians(mouseX));
       rotateZ(angleY[5]);
       rotateY(angleX[5]);
       translate(-4.1,-19.9);
     /* 
      translate(mouseX/10.0,-mouseY/10.0);//移動找到數值
      println(mouseX/10.0,-mouseY/10.0);//印出數值 4.1,-19.9
      */
       shape(uparm2,0,0);
       pushMatrix();
         translate(4.5,16.9);
         //rotateX(radians(mouseX));
         rotateX(angleY[6]);
         rotateY(angleX[6]);
         translate(-4.5,-16.9);
         //translate(mouseX/10.0,-mouseY/10.0);
         //println(mouseX/10.0,-mouseY/10.0);
         shape(hand2,0,0);
       popMatrix();
    popMatrix();
   popMatrix();
}
