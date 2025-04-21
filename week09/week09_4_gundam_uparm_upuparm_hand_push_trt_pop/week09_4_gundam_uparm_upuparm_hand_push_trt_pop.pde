//week09-4_gundam_uparm_upuparm_hand_push_trt_pop
PShape uparm1,upuparm1,hand1;
void setup(){
  size(400,400,P3D);
  uparm1=loadShape("uparm1.obj");
  upuparm1=loadShape("upuparm1.obj");
  hand1=loadShape("hand1.obj");

}

void draw(){
  background(204);
  translate(200,300);
  sphere(3);
  
  scale(10,-10,10);
  shape(upuparm1,0,0);
  pushMatrix();
     translate(-4.1,19.9);
     rotateZ(radians(mouseX));
     translate(4.1,-19.9);
   /* 
    translate(mouseX/10.0,-mouseY/10.0);//移動找到數值
    println(mouseX/10.0,-mouseY/10.0);//印出數值 4.1,-19.9
    */
     shape(uparm1,0,0);
     pushMatrix();
       translate(-4.5,16.9);
       rotateX(radians(mouseX));
       translate(4.5,-16.9);
       //translate(mouseX/10.0,-mouseY/10.0);
       //println(mouseX/10.0,-mouseY/10.0);
       shape(hand1,0,0);
     popMatrix();
  popMatrix();
}
