int c=20;
int keyIndex = 0;
color draw=(#1A27FF);
void setup() {
  frameRate(30);
  size(640, 360);
  surface.setResizable(true);
  background(255);
  fill(#C1C1C1);
  fill(#FF1F26);
  rect(0, 0, 160, 30);
  fill(#1A27FF);
  rect(160, 0, 160, 30);
  fill(#00CE31);
  rect(320, 0, 160, 30);
  fill(255);
  rect(480, 0, 160, 30);
  fill(255);
  rect(0, 30, 160, 30);
  rect(160, 30, 160, 30);
  rect(320, 30, 160, 30);
  rect(480, 30, 160, 30);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(26);

  text("Red", 80, 15);
  text("-", 80, 45);
  text("+", 240, 45);
  text("Blue", 240, 15);
  text("Green", 400, 15);
  text("SAVE", 400, 45);
  text("Erase", 560, 15);
  text("Clear", 560, 45);
}
void draw() {




  fill(draw);
  if (mouseY>=0 && mouseY<=30 && mouseX>=0 && mouseY<=160) {
    if (mousePressed) {
      draw=(#FF1F26);
    }
  }
  if (mouseY>=30 && mouseY<=60 && mouseX>=0 && mouseY<=160) {
    if (mousePressed) {
      if (c>4) {
        c=c-3;
      }
    }
  }
  if (mouseY>=30 && mouseY<=60 && mouseX>160 && mouseY<=320) {
    if (mousePressed) {
      if (c<70) {
        c=c+5;
      }
    }
  }
  if (mouseY>=0 && mouseY<=30 && mouseX>160 && mouseY<=320) {
    if (mousePressed) {
      draw=(#1A27FF);
    }
  }
  if (mouseY>=0 && mouseY<=30 && mouseX>320 && mouseY<=480) {
    if (mousePressed) {
      draw=(#00CE31);
    }
  }
  if (mouseY>=0 && mouseY<=30 && mouseX>480 && mouseY<=640) {
    if (mousePressed) {
      draw=(255);
    }
  }
 
  if (mouseY>=30 && mouseY<=60 && mouseX>480 && mouseY<=640) {
    if (mousePressed) {
      stroke(0);
      rectMode(CORNER);
      background(255);
      fill(#C1C1C1);
      fill(#FF1F26);
      rect(0, 0, 160, 30);
      fill(#1A27FF);
      rect(160, 0, 160, 30);
      fill(#00CE31);
      rect(320, 0, 160, 30);
      fill(255);
      rect(480, 0, 160, 30);
      fill(255);
      rect(0, 30, 160, 30);
      rect(160, 30, 160, 30);
      rect(320, 30, 160, 30);
      rect(480, 30, 160, 30);
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(26);

      text("Red", 80, 15);
      text("-", 80, 45);
      text("+", 240, 45);
      text("Blue", 240, 15);
      text("Green", 400, 15);
      text("SAVE", 400, 45);
      text("Erase", 560, 15);
      text("Clear", 560, 45);
    }
  }
   if (mouseY>=30 && mouseY<=60 && mouseX>320 && mouseY<480) {
    if (mousePressed) {
      saveFrame("Mydrawing-"+year()+month()+day()+hour()+minute()+second()+".png");
      
    }
  }
  if (mouseY>=60+1+c/2 && mouseY<=height-c/2) {
    if (mousePressed) {
      noStroke();
      rectMode(CENTER);
      fill(draw);
      circle(mouseX, mouseY, c);
    }
  }
}
