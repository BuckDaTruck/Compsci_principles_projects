int cactusCount; // the number of cacti currently on screen
float dinosaurX, dinosaurY; // the position of the dinosaur
float dinosaurSpeed; // the vertical speed of the dinosaur
float gravity; // the acceleration due to gravity
int score; // the player's score

float[] cactusX; // the x-position of each cactus
float[] cactusY; // the y-position of each cactus
float cactusSpacing; // the distance between each cactus
float cactusSpeed; // the horizontal speed of the cacti

void setup() {
  size(800, 400);
  resetGame();
}

void resetGame() {
  cactusCount = 0;
  dinosaurX = 50;
  dinosaurY = height - 80;
  dinosaurSpeed = 0;
  gravity = 0.5;
  score = 0;
  cactusSpacing = 300;
  cactusSpeed = 4;
  cactusX = new float[4];
  cactusY = new float[4];
  for (int i = 0; i < 4; i++) {
    cactusX[i] = width + i * cactusSpacing;
    cactusY[i] = height - 100;
  }
}

void draw() {
  background(255);
  
  // draw the floor
  fill(200);
  rect(0, height - 20, width, 20);
  
  // update the position of the dinosaur
  dinosaurSpeed += gravity;
  dinosaurY += dinosaurSpeed;
  
  // stop the dinosaur if it hits the floor
  if (dinosaurY >= height - 80) {
    dinosaurY = height - 80;
    dinosaurSpeed = 0;
  }
  
  // update the position of the cacti
  for (int i = 0; i < 4; i++) {
    cactusX[i] -= cactusSpeed;
    if (cactusX[i] < -40) {
      cactusX[i] = width + cactusSpacing;
    }
    
    // check for collision with dinosaur
    if (dinosaurX + 40 > cactusX[i] && dinosaurX < cactusX[i] + 40 && dinosaurY + 60 > cactusY[i]) {
      resetGame();
    }
    
    // update the score if the dinosaur has passed a cactus
    if (cactusX[i] < dinosaurX && cactusX[i] + 40 > dinosaurX) {
      score++;
    }
    
    // draw the cactus
    rect(cactusX[i], cactusY[i], 40, 60);
  }
  
  // draw the dinosaur
  rect(dinosaurX, dinosaurY, 40, 60);
  
  // draw the score
  textSize(24);
  text("Score: " + score, 10, 30);
}

void keyPressed() {
  // make the dinosaur jump if spacebar is pressed
  if (key == ' ' && dinosaurY >= height - 80) {
    dinosaurSpeed = -12;
  }
}

void mousePressed() {
  // restart the game if the mouse is clicked
  resetGame();
}
