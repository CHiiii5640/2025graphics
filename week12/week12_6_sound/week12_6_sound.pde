//week12-6_sound
//需要聲音的 Library 函式庫
// Sketch - Library -　Ｍanaged Libraries 找 sound | Provides a simple way to work with audio
// File / Examples 開啟 Libraries核心函式庫
//　Soundfile 看 SimplePlayback 簡單播放

import processing.sound.*;
SoundFile mySound;

void setup(){
  size(400,400);
  mySound = new SoundFile(this,"music.mp3");
  mySound.play();
}

void draw(){

}
