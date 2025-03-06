//week03-13_3D_pushMatrix_translate_sphere_popMatrix
void setup(){
  size(600,400,P3D);
}
void draw(){
  background(128);
  lights();
  pushMatrix(); //備份矩陣
    translate(300,100);
    sphere(100);
  popMatrix();//還原矩陣
  
  pushMatrix();
    translate(100,100);
    sphere(100);
  popMatrix();
}
