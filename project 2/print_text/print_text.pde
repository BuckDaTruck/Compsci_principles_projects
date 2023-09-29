int textsize;
void setup() {
  frameRate(30);
  size(640, 480);
  surface.setResizable(true);
  println(hour(), minute(), second());
}
void draw() {
  
  textsize=height-mouseY;
    println(hour(), minute(), second());
  background(255,255,255);
textSize(textsize);
  fill(0,147,1,255);
  textAlign(CENTER,CENTER);
  text("hi", width/2, height/2);
}
