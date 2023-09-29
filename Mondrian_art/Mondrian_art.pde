void setup() {
  size(800, 600);
  background(255);
}
void draw() {
  background(255);
  redrectangles();
  bluerectangles();
  yellowrectangles();
  linesx();
  linesy();
  overlaped();
  picture();
}
void overlaped() {
  strokeWeight(8);
  stroke(0);
  fill(255, 0, 0);
  rect(575, 300, 250, 170);
  rect(-5, 520, 579, 80);
  strokeWeight(8);
  stroke(0);
  fill(244, 245, 52);
  rect(490, 50, 80, 310);
  strokeWeight(8);
  stroke(0);
  fill(0, 0, 255);
  rect(325, 205, 250, 314);
  rect(-5, -5, 80, 310);
}
void  yellowrectangles() {
  strokeWeight(8);
  stroke(0);
  fill(244, 245, 52);
  rect(575, -5, 229, 54);
  rect(75, 440, 250, 80);
}
void bluerectangles() {
  strokeWeight(8);
  stroke(0);
  fill(0, 0, 255);
  rect(325, 205, 250, 314);
}
void redrectangles() {
  strokeWeight(8);
  stroke(0);
  fill(255, 0, 0);
  rect(75, 50, 250, 310);
}
void linesy() {
  strokeWeight(8);
  stroke(0);
  line(75, 0, 75, 600);
  line(575, 0, 575, 600);
}
void linesx() {
  strokeWeight(8);
  stroke(0);
  line(0, 50, 800, 50);
  line(0, 360, 800, 360);
  line(0, 520, 800, 520);
}
void picture() {
  if (mousePressed) {
    saveFrame("MondrianArt.png");
  }
}
