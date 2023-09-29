float[] xpos = {random(width),random(width),random(width),random(width),random(width)};
float[] ypos = {0,-100,-200,-300,-400};


void setup(){
  size(500,500);

}

void draw(){
  background(0);
  fallingCircle(xpos,ypos);
  endgame(xpos,ypos);
  player();
  
}

void fallingCircle(float[] x, float[] y){
 
  for(int i =0; i<x.length;i++){
    y[i]+=5;
    if(y[i]>height){
      y[i]=0;
      x[i] = random(width);
     fill(random(255),random(255),random(255));
    }
    circle(x[i],y[i],50);
  }
}

void player(){
 circle(mouseX,height-25,50); 
}

void endgame(float[] x, float[] y){
  for(int i =0; i<x.length;i++){
     boolean hit = collision(x[i],y[i],25,mouseX,height-25,25);
     if(hit){
        background(255,0,0);
        stop();
        textSize(100);
        fill(0);
        text("YOU LOSE",10,200);
   }
}
}

boolean collision(float x1, float y1, float r1, float x2, float y2, float r2) {
  float distX = x1 - x2;
  float distY = y1 - y2;
  float distance = sqrt( (distX*distX) + (distY*distY) );
  if (distance <= r1+r2) {
    return true;
  }
  return false;
}
