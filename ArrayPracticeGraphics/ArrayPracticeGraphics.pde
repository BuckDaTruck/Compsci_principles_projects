void setup(){
  size(300, 400);
  background(#FFFFFF);
}

void draw(){
  barsArrayBetterWay();
}

void barsArrayBetterWay(){
    // create an array called bars and populate it with numbers
    int[] bars = {50, 61, 83, 199, 71, 50, 150, 31, 5, 124,  88, 0, 34};
    fill(#FF0055);
    // read one array element at a time using a for loop
    for (int i = 0; i < bars.length; i++){
      rect(0,i*20 ,bars[i] , 20);
    }
}

void barsArrayLongWay(){
  int x0 = 50;
  int x1 = 61;
  int x2 = 83;
  int x3 = 199;
  int x4 = 71;
  int x5 = 50;
  int x6 = 150;
  int x7 = 31;
  int x8 = 5;
  int x9 = 124;
  fill(#0000FF);
  rect(0, 0, x0, 20);
  rect(0, 20, x1, 20);
  rect(0, 40, x2, 20);
  rect(0, 60, x3, 20);
  rect(0, 80, x4, 20);
  rect(0, 100, x5, 20);
  rect(0, 120, x6, 20);
  rect(0, 140, x7, 20);
  rect(0, 160, x8, 20);
  rect(0, 180, x9, 20); 
}
