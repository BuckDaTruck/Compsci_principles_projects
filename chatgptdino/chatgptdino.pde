float cactush[] = {random(25, 55), random(25, 55), random(25, 55)};
float cactus[] = {400, 800, 1200};
float player=250;
float playerh=200;
int score = 0;
int highScore = 0;
boolean gameOver = false;
boolean inair;

PFont gameFont;

void setup() {
  size(800, 400);
  background(100, 100, 255);
  frameRate(60);
  
  // Load custom font
  gameFont = createFont("VT323-Regular.ttf", 48);
}

void draw() {
  
  if (gameOver) {
    background(255, 0, 0);
    String scores = "Score : " + score;
    String highScores = "High Score : " + highScore;
    fill(255, 255, 255);
    textSize(30);
    textFont(gameFont);
    textAlign(CENTER, CENTER);
    text(scores, width/2, height/2);
    text(highScores, 120, 450);
    textSize(20);
    text("Click to Restart", width/2, height/2-40);
  } else {

    // Define the sun angle
    float sunAngle = millis() / 10000.0;
    float sunX = width/2 + 150*cos(sunAngle);
    float sunY = height/2 + 150*sin(sunAngle);
    
    // Draw the sun
    noStroke();
    fill(255, 255, 0);
    ellipse(sunX, sunY, 50, 50);
    
    // Draw the cactus with texture
    int textureOffset = millis() / 10;
    for (int i = 0; i < cactus.length; i++) {
      float x = cactus[i];
      float h = cactush[i];
      image(texture, x, height-200-h, 20, h);
      x -= textureOffset % 20; // make the texture move with the cactus
      cactus[i] = x;
    }

    // Draw the player
    line(0, 200, width, 200);
    fill(255, 255, 255);
    rect(player, height-playerh-70, 10, 70);
    
    // Update player position
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

    // Draw the score and high score
    stroke(color(255, 255, 255));
    textSize(30);
    textFont(gameFont);
    textAlign(LEFT, TOP);
    fill(255, 255, 255);
    text("Score: " + score, 10, 10);
    textAlign(RIGHT, TOP);
    text("High Score: " + highScore, width-10, 10);
    
    for (int i=0; i<cactus.length; i++) {
    fill(255, 255, 255);
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
