//week04-5a_rotateZ_translate_box
void setup(){
  size(400,400,P3D);
}

void draw(){
  background(128);
  translate(width/2,height/2); //畫面中心
    
    rotateZ(radians(frameCount)); //對Z軸旋轉
    translate(0,-50); //下端 移到中心 
    box(10,100,10); 
}
