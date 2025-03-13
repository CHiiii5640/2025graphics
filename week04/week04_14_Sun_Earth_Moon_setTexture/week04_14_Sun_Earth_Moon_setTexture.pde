//week04-14_Sun_Earth_Moon_setTexture
PShape earth,moon,sun;
void setup(){
  size(400,400,P3D);
  
  earth=createShape(SPHERE,30);
  PImage img=loadImage("earth.jpg");
  earth.setTexture(img);
  
  sun=createShape(SPHERE,50);
  img=loadImage("sun.jpg");
  sun.setTexture(img);
  
  moon=createShape(SPHERE,10);
  img=loadImage("moon.jpg");
  moon.setTexture(img);
}
void draw(){
  background(128);
  translate(width/2,height/2);
  shape(sun);//太陽
  rotateY(radians(frameCount));
  pushMatrix();
    translate(150,0);
    rotateY(radians(frameCount));
    shape(earth);//地球
    pushMatrix();
      translate(50,0);
      rotateY(radians(frameCount));
      shape(moon);//月球
    popMatrix();
 popMatrix();
}
