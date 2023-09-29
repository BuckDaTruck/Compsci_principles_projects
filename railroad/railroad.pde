int trw;
int trh;
int z=0;
int h=0;
int c=0;
float turtle=0;
float a=0;
float w=.001;
int num = 30000;
int[] x = new int[num];
int[] y = new int[num];
int[] t = new int[num];
void setup() {
  size(1024, 768);
  background(#0DAEFC);
  for (int i = num-1; i > 0; i--) {
    x[i] = int(random(width/3, width*2/3));
    y[i] = int(random(height/2+4, height));
    t[i] = int(random(1, 7));
  }
}
void draw() {
  background(#0DAEFC);
  track();
  land();
  saved();
}
void saved() {
  if (mouseY>=660 && mouseY<=720 && mouseX>40 && mouseX<140) {
    if (mousePressed) {
      saveFrame("rail"+year()+month()+day()+hour()+minute()+second()+".png");
    }
  }
}
void land() {
  fill(#E8E110);
  circle(width*6/7, height/7, height/5);
  noStroke();
  strokeWeight(3);
  beginShape();
  fill(#007612);
  vertex(width/3-20, height);
  vertex(width/2-1, height/2+1);
  vertex(0, height/2+1);
  vertex( 0, height);
  endShape(CLOSE);
  beginShape();
  fill(#007612);
  vertex(width*2/3+20, height);
  vertex(width/2+1, height/2+1);
  vertex(width, height/2+1);
  vertex(width, height);
  endShape(CLOSE);
  plants();
  while (turtle<4) {
    turtle(int(100+turtle*197), int(580+turtle*-13));
    turtle++;
  }
  turtle=0;
  for (int a=0; a<3; a++) {
    cloud(100+a*356, 100+a*35);
  }
  for (int a=0; a<4; a++) {
    tree(300-a*67, height-550+a*39);
  }
  for (int a=0; a<4; a++) {
    tree(width-300+a*67, height-550+a*39);
  }
}
void track() {
  rectMode(CORNER);
  noStroke();
  strokeWeight(3);
  beginShape();
  fill(#9B9B9B);
  vertex(width/3-20, height);
  vertex(width/2-1, height/2-1);
  vertex(width/2+1, height/2-1);
  vertex(width*2/3+20, height);
  endShape(CLOSE);
  stroke(0);
  for (int i = 0; i < num; i++) {
    fill(#9B9B9B);
    strokeWeight(.1);
    ellipse(x[i], y[i], 3, t[i]);
  }
  fill(#483725);
  a=40;
  rectMode(CENTER);
  while (a<10000) {
    fill(#483725);
    noStroke();
    rect(width/2, a+height/2-37, 10000, w+1);
    a+=a*(a/700);
    w+=w*(.83);
  }
  w=.001;
  strokeWeight(3);
  noStroke();
  fill(#746E6B);
  quad(width/2, height/2, width/2, height/2-2, width/3-4, height+4, width/3+4, height+4);
  quad(width/2, height/2, width/2, height/2-2, width*2/3+4, height+4, width*2/3-4, height+4);
}
