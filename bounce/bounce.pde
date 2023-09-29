int xspeed=55;
int yspeed=55;
float xpos = 0;
float ypos = 55;
int shape = 1;
boolean change=true;
void setup() {
  size(1000, 700);
  background(0);
}
void draw() {
  bounce();
}
void bounce() {


  if (change==true) {
    fill(0, 0, int(random(255)));
    change=false;
  }

  if ( shape==1) {
    ellipse(xpos, ypos, 50, 50);
  }
  if ( shape==-1) {
    rect(xpos, ypos, 50, 50);
    // ellipse(xpos, ypos, 50, 50);
  }

  xpos=xpos+xspeed;
  ypos=ypos+yspeed;
  if (ypos>=height ) {
    yspeed=yspeed*-1;
    shape=shape*-1;
    change=true;
  }
  if (xpos>=width) {
    xspeed=xspeed*-1;
    shape=shape*-1;
    change=true;
  }
  if (ypos<=0 ) {
    yspeed=yspeed*-1;
    shape=shape*-1;
    change=true;
  }
  if (xpos<=0) {
    xspeed=xspeed*-1;
    shape=shape*-1;
    change=true;
  }
}
