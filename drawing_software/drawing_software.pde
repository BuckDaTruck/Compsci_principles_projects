int c=20;
int keyIndex = 0;
color draw=(#1A27FF);
void setup() {
  frameRate(30);
  size(1440, 900);
  surface.setResizable(true);
  background(255);
  fill(#C1C1C1);
  fill(#FF1F26);
  rect(0, 0, width/7, 30);
  fill(#1A27FF);
  rect(width*1/7, 0, width/7, 30);
  fill(#00CE31);
  rect(width*2/7, 0, width/7, 30);
  fill(255);
  rect(width*3/7, 0, width/7, 30);
  fill(255);
  rect(0, 30, width/7, 30);
  rect(width*1/7, 30, width/7, 30);
  rect(width*2/7, 30, width/7, 30);
  rect(width*3/7, 30, width/7, 30);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(26);

  text("Red", width*.5/7, 15);
  text("-", width*.5/7, 45);
  text("+", width*1.5/7, 45);
  text("Blue", width*1.5/7, 15);
  text("Green", width*2.5/7, 15);
  text("SAVE", width*2.5/7, 45);
  text("Erase", width*3.5/7, 15);
  text("Clear", width*3.5/7, 45);
}
void draw() {




  fill(draw);
  stroke(0);
  rectMode(CORNER);

  fill(#C1C1C1);
  fill(#FF1F26);
  rect(0, 0, width/7, 30);
  fill(#1A27FF);
  rect(width*1/7, 0, width/7, 30);
  fill(#00CE31);
  rect(width*2/7, 0, width/7, 30);
  fill(255);
  rect(width*3/7, 0, width/7, 30);
  fill(255);
  rect(0, 30, width/7, 30);
  rect(width*1/7, 30, width/7, 30);
  rect(width*2/7, 30, width/7, 30);
  rect(width*3/7, 30, width/7, 30);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(26);

  text("Red", width*.5/7, 15);
  text("-", width*.5/7, 45);
  text("+", width*1.5/7, 45);
  text("Blue", width*1.5/7, 15);
  text("Green", width*2.5/7, 15);
  text("SAVE", width*2.5/7, 45);
  text("Erase", width*3.5/7, 15);
  text("Clear", width*3.5/7, 45);

  if (mouseY>=0 && mouseY<=30 && mouseX>=0 && mouseX<=160) {
    if (mousePressed) {
      draw=(#FF1F26);
    }
  }
  if (mouseY>=30 && mouseY<=60 && mouseX>=0 && mouseX<=160) {
    if (mousePressed) {
      if (c>4) {
        c=c-3;
      }
    }
  }
  if (mouseY>=30 && mouseY<=60 && mouseX>160 && mouseX<=320) {
    if (mousePressed) {
      if (c<70) {
        c=c+5;
      }
    }
  }
  if (mouseY>=0 && mouseY<=30 && mouseX>160 && mouseX<=320) {
    if (mousePressed) {
      draw=(#1A27FF);
    }
  }
  if (mouseY>=0 && mouseY<=30 && mouseX>320 && mouseX<=480) {
    if (mousePressed) {
      draw=(#00CE31);
    }
  }
  if (mouseY>=0 && mouseY<=30 && mouseX>480 && mouseX<=640) {
    if (mousePressed) {
      draw=(255);
    }
  }
    if (mouseY>=30 && mouseY<=60 && mouseX>320 && mouseX<480) {
    if (mousePressed) {
      saveFrame("Mydrawing-"+year()+month()+day()+hour()+minute()+second()+".png");
    }
  }
  if (mouseY>=30 && mouseY<=60 && mouseX>480 && mouseX<=640) {
    if (mousePressed) {
      stroke(0);
      rectMode(CORNER);
      background(255);
      fill(#C1C1C1);
      fill(#FF1F26);
      rect(0, 0, width/7, 30);
      fill(#1A27FF);
      rect(width*1/7, 0, width/7, 30);
      fill(#00CE31);
      rect(width*2/7, 0, width/7, 30);
      fill(255);
      rect(width*3/7, 0, width/7, 30);
      fill(255);
      rect(0, 30, width/7, 30);
      rect(width*1/7, 30, width/7, 30);
      rect(width*2/7, 30, width/7, 30);
      rect(width*3/7, 30, width/7, 30);
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(26);
      text("Red", width*.5/7, 15);
      text("-", width*.5/7, 45);
      text("+", width*1.5/7, 45);
      text("Blue", width*1.5/7, 15);
      text("Green", width*2.5/7, 15);
      text("SAVE", width*2.5/7, 45);
      text("Erase", width*3.5, 15);
      text("Clear", width*3.5, 45);
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
