//week12-1_gundam_head_body_uparm_upuparm_hand
//修改自week09-2_gundam_head_body_push_trt_pop
//加上week09_5_gundam_uparm_upuparm_hand_keyboard_mouse_angle
PShape body,head;
PShape uparm1,upuparm1,hand1; //week09-5

void setup(){
  size(400,400,P3D);
  body=loadShape("body.obj");
  head=loadShape("head.obj");
  uparm1=loadShape("uparm1.obj");//week09-5
  upuparm1=loadShape("upuparm1.obj");//week09-5
  hand1=loadShape("hand1.obj");//week09-5
}


float [] angleX = new float[10];
float [] angleY = new float[10];
int ID = 0; // 0:head, 1: upuparm, 2:uparm, 3:hand

void mouseDragged(){
  angleX[ID] += radians(mouseX - pmouseX); //左右拖曳
  angleY[ID] += radians(mouseY - pmouseY); //上下拖曳
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
}
