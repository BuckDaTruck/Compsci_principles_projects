int ball=30;
float xpos, ypos;
float playpaddle=height/2;
float comp=height/2;
float yspeed=5;
float xspeed=5;
float compspeed;
float scompspeed=2.15;
float playspeed=4.5;
float xdirection=1;
float ydirection=1;
int compscore;
int playscore;
int col=8;
int dif=1;
void setup() {
  size(800, 400);
  surface.setResizable(true);
  background(0);
  frameRate(30);
  ypos = height/2;
  xpos = width/2;
}
void draw() {
  ball=height/(400/10);
  yspeed=height/80;
  xspeed=width/160;
  compspeed=width/(400/scompspeed);
  playspeed=width/(400/4.5);
  if (key == 'r') {
    ypos = height/2;
    xpos = width/2;
    compscore=0;
    playscore=0;
  }
  if (key=='1') {
    dif=1;
  }
  if (key=='2') {
    dif=2;
  }
  if (key=='3') {
    dif=3;
  }
  if (dif==1) {
    yspeed=height/80;
    xspeed=width/160;
    compspeed=width/(400/scompspeed);
    playspeed=width/(400/4.5);
  }
  if (dif==2) {
    yspeed=height/80;
    xspeed=width/160;
    compspeed=width/(400/2.2);
    playspeed=width/(400/4.);
  }
  if (dif==3) {
    yspeed=height/60;
    xspeed=width/120;
    compspeed=width/(400/2.25);
    playspeed=width/(400/3.8);
  }



  if (ypos>comp) {
    comp=comp+compspeed;
  }
  if (ypos<comp) {
    comp=comp-compspeed;
  }
  background(0);
  strokeWeight(3);
  stroke(0);
  if (key=='1') {
    dif=1;
  }
  if (key=='2') {
    dif=2;
  }
  if (key=='3') {
    dif=3;
  }
  if (key=='w') {
    col=8;
  }
  if (key=='b') {
    col=9;
  }
  if (key=='c') {
    col=7;
  }
  if (col==8) {
    fill(255);
    rectMode(CORNER);
    rect(0, 0, width/2, height-1);
    rect(width/2, 0, width/2-1, height-1);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(35);
    rectMode(CENTER);
    fill(255);
    rect(width-10, playpaddle, 10, height/(400/60));
    rect(10, comp, 10, height/(400/60));
    fill(0);
    text(compscore, 25, 10);
    text(playscore, width-25, 10);
    xpos=xpos+(xdirection*xspeed);
    ypos=ypos+(ydirection*yspeed);
    fill(255);
    circle(xpos, ypos, ball*2);
    fill(255);
  } else if (col==9) {
    fill(255);
    rectMode(CENTER);
    rect(width-10, playpaddle, 10, height/(400/60));
    rect(10, comp, 10, height/(400/60));
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 10, height);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(35);
    text(compscore, 25, 10);
    text(playscore, width-25, 10);
    xpos=xpos+(xdirection*xspeed);
    ypos=ypos+(ydirection*yspeed);
    fill(255);
    circle(xpos, ypos, ball*2);
    fill(255);
  } else if (col==7) {
    stroke(255);
    fill(255);
    rectMode(CORNER);
    fill(#07E808);
    rect(0, 0, width/2, height-1);
    fill(#FF1C1C);
    rect(width/2, 0, width/2-1, height-1);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(35);
    rectMode(CENTER);
    fill(255);
    rect(width-10, playpaddle, 10, height/(400/60));
    rect(10, comp, 10, height/(400/60));
    fill(0);
    text(compscore, 25, 10);
    text(playscore, width-25, 10);
    xpos=xpos+(xdirection*xspeed);
    ypos=ypos+(ydirection*yspeed);
    fill(255);
    circle(xpos, ypos, ball*2);
    fill(255);
  }
  if (keyPressed) {

    if (keyCode == UP) {
      playpaddle=playpaddle-playspeed;
    } else if (keyCode == DOWN) {
      playpaddle=playpaddle+playspeed;
    }
  }
  if (xpos>=((width-15)-ball)&& xpos<=((width-14)-ball)&& ypos< (playpaddle+height/(400/30))&& (playpaddle-height/(400/30))<ypos) {
    xdirection=xdirection*-1;
  }
  if (xpos<=(15+ball)&& xpos>=(14+ball)&& ypos< (comp+height/(400/30))&& (comp-height/(400/30))<ypos) {
    xdirection=xdirection*-1;
  }
  if (ypos>height-ball||ypos<0+ball) {
    ydirection=ydirection*-1;
  }
  if (playpaddle>height-height/(400/30)) {
    playpaddle=playpaddle-playspeed;
  }
  if (playpaddle<height/(400/30)) {
    playpaddle=playpaddle+playspeed;
  }
  if (xpos>=width) {
    xdirection=-1;
    compscore=compscore+1;
    xpos=width/2;
    ypos=random(height/3, height/1.5);
  }
  if (xpos<=0) {
    xdirection=1;
    playscore=playscore+1;
    xpos=width/2;
    ypos=random(height/3, height/1.5);
  }
}
