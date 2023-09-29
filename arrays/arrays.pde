void setup() {
  size(200, 200);
  background(#FFFFFF);
}
void draw() {
  int[] bars = {51, 23, 37, 42, 86, 32, 54, 21, 84};

  for (int i = 0; i < bars.length; i++) {
      fill(#FF0055);
    rect(0, i*20, bars[i], 20);
  }
}
