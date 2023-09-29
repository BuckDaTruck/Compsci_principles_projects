int num = 300;
int[] x = new int[num];
int[] y = new int[num];
int[] t = new int[num];
void setup() {
  frameRate(1);
  size(1024, 768);
  for (int i = num-1; i > 0; i--) {
    x[i] = int(random(0, width));
    y[i] = int(random(0, height));
    t[i] = int(random(10, 70));
  }
}
void draw() {
  for (int i = 0; i < num; i++) {
    fill(#0000ff);
    strokeWeight(.1);
    ellipse(x[i], y[i], 40, t[i]);
  }
}
