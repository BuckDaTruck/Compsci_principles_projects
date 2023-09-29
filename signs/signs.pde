PFont myFont;
void setup() {
  size(1000, 500);
  background(255);
  myFont = createFont("Arial Bold", 160);
}
void draw() {
  rail();
  Light();
}
void rail() {
  fill(#D6E32C);
  noStroke();
  circle(250, 250, 450);
  stroke(0);
  strokeWeight(14);
  circle(250, 250, 425);
  fill(0);
  strokeWeight(30);
  line(105, 105, 395, 395);
  line(395, 105, 105, 395);
  textSize(60);
  textFont(myFont);
  textMode(CENTER);
  text("R", 60, 300);
  text("R", 340, 300);
  strokeWeight(14);
}
void Light() {
  pushMatrix();
  rotate(PI/4.0);
  fill(#D6E32C);
  noStroke();
  rectMode(CORNER);
  rect(522, -526, 360, 360, 10);
  stroke(0);
  strokeWeight(14);
  rect(534, -515, 335.8757, 335.8757, 15);
  popMatrix();
  rectMode(CENTER);
  fill(0);
  rect(742, 250, 100, 300);
  fill(#F8FC08);
  noStroke();
  circle(742, 250, 94);
  fill(#11C402);
  circle(742, 350, 94);
  fill(#FC081C);
  circle(742, 150, 94);
  stroke(0);
  strokeWeight(3);
  fill(255);
  circle(742, 40, 10);
  circle(742, 460, 10);
}
