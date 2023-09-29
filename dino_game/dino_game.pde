float cactush[] = {random(25, 55), random(25, 55), random(25, 55)};
float cactus[] = {400, 800, 1200};
float player=250;
float playerh=200;
int score = 0;
int highScore = 0;
boolean gameOver = false;
boolean inair;
void setup() {
  size(800, 400);
  background(255, 255, 255);
  frameRate(60);
}
void draw() {
  if (gameOver) {
    background(255, 0, 0);
    String scores = "Score : " + score;
    String highScores = "High Score : " + highScore;
    fill(255, 255, 255);
    textSize(30);
    textMode(CENTER);
    text(scores, width/2, height/2);
    text(highScores, 120, 450);
    textSize(20);
    text("Click to Restart", width/2, height/2-40);
  } else {

    background(255, 255, 255);

    if (millis() > 1000) {
      player();
      stroke(color(0, 0, 0));
      cactus();
        textSize(15);
      text("Score: " + score, 10, 20);
       text("High Score: " + highScore, width-140, 20);
    }
  }
}
void player() {
  line(0, 200, width, 200);
  rect(player, height-playerh-70, 10, 70);
  if (inair) {
    if (playerh>200) {
      playerh-=2;
    } else {
      inair=false;
    }
  } else {

    if (keyPressed) {

      if (key == ' ') {
        playerh+=80;
        inair=true;
      }
    }
  }
}
void cactus() {
  for (int i=0; i<cactus.length; i++) {
    fill(0, 0, 0);
    rect(cactus[i], height-200-cactush[i], 20, cactush[i]);
    cactus[i]-=4;
    if (playerh-200<cactush[i] && player<cactus[i]+20 && player>cactus[i]) {
      gameOver=true;
    }
    if (cactus[i]<0) {
      score+=1;
      cactus[i]=random(1180, 1220);
      cactush[i]=random(25, 55);
    }
  }
}
void mousePressed() {
  if (gameOver) {
    if (score > highScore) {
      highScore = score;
    }
    cactus[0]=400;
     cactus[1]=800;
      cactus[2]=1200;
    gameOver = false;
    score = 0;
  }
}
