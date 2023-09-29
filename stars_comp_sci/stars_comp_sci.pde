void setup() {
  size(400, 800);
}
void draw() {
  textSize(30);
  stroke(0);
  fill(0);
  for (int x=0; x<=4; x++) {
    for (int z=0; z<=x; z++) {
      text("*", 10+z*30, x*30+width/2);
    }
  }
}
