//week04-10_Earth_createShape_setTexture_shape
size(400,400,P3D);
PShape earth=createShape(SPHERE,100);
PImage img=loadImage("earth.jpg");
earth.setTexture(img);
shape(earth);
