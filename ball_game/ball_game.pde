float y=0;
float x=230;
float y2=-70;
float x2=10;
int score = 0;
int highScore = 0;
boolean gameOver = false;

void setup(){
  size(400,800);
  background(255,255,255);
  frameRate(60);
}

void draw(){
  if(gameOver){
    background(255,0,0);
    String scores = "Score : " + score;
    String highScores = "High Score : " + highScore;
    fill(255,255,255);
    textSize(30);
    text(scores,135,400);
    text(highScores,120,450);
    textSize(20);
    text("Click to Restart",150,500);
  }
  else{
    background(255,255,255);
    player();
    if (millis() > 1000) {
      obstacleBalls();
      obstacleBalls2();
      endGame(50,20,mouseX,700,x,y);
      endGame(50,20,mouseX,700,x2,y2);
      textSize(20);
      fill(0,0,0);
      text("Score: " + score, 10, 20);
    }
  }
}

void mousePressed(){
  if(gameOver){
    if(score > highScore){
      highScore = score;
    }
    gameOver = false;
    score = 0;
    x = random(25,375);
    x2 = random(25,375);
    y = -70;
    y2 = -70;
  }
}

void player(){
  fill(color(0,0,255));
  strokeWeight(10);
  stroke(color(0,0,0));
  circle(mouseX,700,100);
}

void obstacleBalls(){
  fill(color(255,0,0));
  strokeWeight(5);
  stroke(color(0,0,0));
  circle(x,y,40);
  y+=10;
  if(y>830){
    y=-1;
    x = random(25,375);
    score++;
  }
}

void obstacleBalls2(){
  fill(color(0,255,0));
  strokeWeight(5);
  stroke(color(0,0,0));
  circle(x2,y2,40);
  y2+=10;
  if(y2>830){
    y2=-1;
    x2 = random(25,375);
    score++;
  }
}

float distance(float x1, float y1, float x2, float y2){
  float diffX = x2-x1;
  float diffY = y2-y1;
  diffX = diffX * diffX;
  diffY*=diffY;
  return sqrt(diffX+diffY);
}



void endGame(float r1, float r2, float x1, float y1, float x2, float y2){
  float dist = distance(x1,y1,x2,y2);
  if(dist<=r1+r2){
    gameOver = true;
  }
}
