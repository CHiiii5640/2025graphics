//week08-1_loadShape_shape
size(400,400,P3D);//P3D OpenGL功能
PShape gundam=loadShape("Gundam.obj"); //1.讀入3D模型
translate(width/2,height/2);//畫面中心
pushMatrix();
  translate(0,100);
  scale(10,-10,10);//4.把模型放大shape(10) 上下要倒過來(-10)
  shape(gundam,0,0);//2.畫出3D模型
popMatrix();
