float cookieCount = 0;
float grandmaCost = 50;
float grandmaCount = 0;
float autoClickerCost = 100;
float autoClickerCount = 0;
float ovenCost = 200;
float ovenCount = 0;
int lastUpdateTime = 0;
float cookiesPerSecond = 0; // Initialize cookies per second

void setup() {
  size(480, 480);
}

void draw() {
  background(230, 230, 250);
  
  // Calculate the cookies per second based on the number of auto-clickers and ovens
  cookiesPerSecond = autoClickerCount * 10. + ovenCount * 500000000 + grandmaCount * 1;
  
  // Update the cookie count based on the cookies per second
  if (millis() - lastUpdateTime >= 1000) {
    cookieCount += cookiesPerSecond;
    lastUpdateTime = millis();
  }
  
  // Draw the cookie count and cookies per second
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(cookieCount, width/2, 100);
  textSize(20);
  text("Cookies Per Second: " + cookiesPerSecond, width/2, 150);
  
  // Draw the buttons
  fill(135, 206, 250);
  rect(20, 400, 120, 50, 20);
  fill(255);
  textSize(20);
  text("Grandma", 80, 430);
  text(grandmaCost, 80, 460);
  
  fill(50, 205, 50);
  rect(170, 400, 120, 50, 20);
  fill(255);
  textSize(20);
  text("Auto Clicker", 230, 430);
  text(autoClickerCost, 230, 460);
  
  fill(255, 215, 0);
  rect(320, 400, 120, 50, 20);
  fill(255);
  textSize(20);
  text("Oven", 380, 430);
  text(ovenCost, 380, 460);
  
  // Draw the counts for each item
  textSize(20);
  text("Grandma: " + grandmaCount, 30, 350);
  text("Auto Clicker: " + autoClickerCount, 180, 350);
  text("Oven: " + ovenCount, 340, 350);
}

void mouseClicked() {
  if (mouseX > 20 && mouseX < 140 && mouseY > 400 && mouseY < 450) {
    if (cookieCount >= grandmaCost) {
      cookieCount -= grandmaCost;
      grandmaCount++;
      grandmaCost += 10;
    }
  } else if (mouseX > 170 && mouseX < 290 && mouseY > 400 && mouseY < 450) {
    if (cookieCount >= autoClickerCost) {
      cookieCount -= autoClickerCost;
      autoClickerCount++;
      autoClickerCost += 10;
    }
  } else if (mouseX > 320 && mouseX < 440 && mouseY > 400 && mouseY < 450) {
    if (cookieCount >= ovenCost) {
      cookieCount -= ovenCost;
      ovenCount++;
      ovenCost += 50;
    }
  } else {
    cookieCount++;
  }
}
