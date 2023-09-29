//I like turtles
int t=0;
int h=0;

void setup() {
  println("I like turtles");
  size(1024, 768);
  background(255);
}
void draw() {
  background(255);
  for (int a=0; a<9; a++) {
    // turtle(int(random(1024)), int(random(768))-100);
    turtle(100+a*20, 100+a*20);
  }
  if(t>width+50){
  t=-50;
  h=h+60;
}
if(h>height){
  h=0;
}
}

void turtle(int x, int y) {
  t++;
  fill(random(0, 6), random(150, 170), random(10, 20));
  rect(x+t, y+100+h, 20, 50);//legs
  rect(x+50+t, y+100+h, 20, 50);//legs
  fill(random(90, 110), random(110, 130), random(80, 100));
  ellipse(x+30+t, y+100+h, 100, 40);//body
  fill(random(0, 6), random(150, 170), random(10, 20));
  ellipse(x+90+t, y+80+h, 35, 15);//head
  fill(random(6, 14), random(80, 100), random(10, 20));
  ellipse(x+74+t, y+93+h, 10, 37);//head
}
