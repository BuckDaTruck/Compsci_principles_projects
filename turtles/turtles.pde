//I like turtles
int a=0;
void setup() {
  println("I like turtles");
  size(1024, 768);
  background(255);
}
void draw() {
  while (a<3) {
    turtle(int(random(1024)), int(random(768))-100);
    a++;
  }
}
void turtle(int x, int y) {
  fill(random(0, 6), random(150, 170), random(10, 20));
  rect(x, y+100, 20, 50);//legs
  rect(x+50, y+100, 20, 50);//legs
  fill(random(90, 110), random(110, 130), random(80, 100));
  ellipse(x+30, y+100, 100, 40);//body
  fill(random(0, 6), random(150, 170), random(10, 20));
  ellipse(x+90, y+80, 35, 15);//head
  fill(random(6, 14), random(80, 100), random(10, 20));
  ellipse(x+74, y+93, 10, 37);//head
}
