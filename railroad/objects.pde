void tree(int x, int y) {
  stroke(0);
  rectMode(CORNER);
  fill(#8B5038);
  rect(x, y, 50, 320);
  fill(#438B38);
  ellipse(x+20, y, 267, 86);
}
void plants(){
  fill(#6AB25F);
   for (int i = height/2; i <= height; i+=63) {
        for (int c = 0; c <= width; c+=31) {
          ellipse(c,i,5,9);
        }
   }
}
void cloud(int x, int y) {
  fill(#FFFFFF);
  ellipse(x+z, y+h, 123, 56);
  ellipse(x+50+z, y-10+h, 56, 24);
  ellipse(x+z, y-23+h, 56, 24);
  ellipse(x-36+z, y-18+h, 47, 34);
}
void turtle(int x, int y){
    rectMode(CORNER);
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
