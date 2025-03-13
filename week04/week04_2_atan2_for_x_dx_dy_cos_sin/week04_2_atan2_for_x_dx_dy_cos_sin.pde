//week04-2_atan2_for_x_dx_dy_cos_sin
void setup(){
  size(600,480);
}
void draw(){
   background(#C0FFEE);
   for(int x=150;x<=450;x+=300){
     ellipse(x,150,100,100);
     float dx=mouseX-150,dy=mouseY-150;
     float a=atan2(dy,dx);
     ellipse(x+cos(a)*25,150+sin(a)*25,50,50);
   }
}
