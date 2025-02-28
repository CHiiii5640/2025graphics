//week02-2__for_for_if_rect
size(400,400);
background(255);
fill(238);
noStroke();
float s=400/14; //格子大小
for(int i=0;i<14;i++){ //左手i對應y座標
  for(int j=0;j<14;j++){ //左手j對應x座標
    //rect(0,i*s*2,s,s);
    if((i+j)%2==0) rect(j*s,i*s,s,s);
    rect(j*s*2,i*s*2,s,s);
  }
}
