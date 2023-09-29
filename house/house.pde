PFont d;
PImage brick;
PImage door;
PImage car;
PImage dudes;
PImage dudesr;
PImage dudesf;
PImage dudesfr;
PImage bike;//bikedude image
int smoke = 1000;
int[] smokex = new int[smoke];
int[] smokey = new int[smoke];
int num = 30000;//array for amount of grass
int[] gx = new int[num];//grass x positions
int[] gy = new int[num];//grass y positions
int[] gt = new int[num];// grass heights
int text;
int carpos = -100;
int carend = carpos-112;
int carfront = carpos+113;
int cartop = 360-55-113;
int carbottom = 360-55+113;// position of carbottom
int deaths = 0;
int x =mouseX;
int y =mouseY;
int fmrx = mouseX;
int topw;
int botw;
int sunc;
int oldwidth;
int third=0;
int msg;
String[] info ={"6,516 pedestrians are killed each year in america.", "Don't jaywalk."};
float l=0;//sidewalk lines
float m=0;// road marker
float cloud1s = random(.1, .9);
float cloud2s = random(.1, .9);
float cloud3s = random(.1, .9);
float cloud1 =-100;
float cloud2 =123;
float cloud3 =560;
float walker1s = - random(.9, 1.9);
float walker2s = -random(.7, 1.7);
float walker3s = random(.9, 1.7);
float walker1 =70;
float walker2 =274;
float walker3 =457;// extra walker positions + starting value I didn't use
boolean death=false;
boolean ready=false;
boolean first=true;
boolean up=true;
boolean reaversed=true;
boolean fly;
void setup() {
  frameRate(30);
  size(700, 400);
  surface.setResizable(true);
  background(#0DAEFC);
  fill(255);
  textSize(60);
  textAlign(CENTER);
  d= createFont("pricedown bl.ttf", 60);
  textFont(d);
  text("Loading...", width/2, height/3);
  brick = loadImage("brick.jpeg");
  door = loadImage("door.png");
  car = loadImage("car.png");
  dudes = loadImage("dude.png");
  dudesr = loadImage("duder.png");
  dudesf = loadImage("dudef.png");
  dudesfr = loadImage("dudefr.png");
  bike = loadImage("bike.png");
  oldwidth =width;
  for (int i = num-1; i > 0; i--) {
    gx[i] = int(random(width));
    gy[i] = int(random(height-125, height-75));
    gt[i] = int(random(1, 7));
  }
}
void draw() {
  backdrop();
  sun();
  clouds();
  smoke();
  house();
  road();
  space();//composition of spacing for dude when he is behind or infront of
  car();
  death();
  general();
}
void space() {
  dude();
  walkers();
  if (ready==false) {
    if (mouseY>height-100) {// so guy appears behind biker
      dude();
    }
  }
  if (ready==true) {
    dude();
  }
}
void dude() {
  if (ready==false) {
    if ( mouseY>=height-123-dudes.height/28 &&(mouseX<width/2-100||mouseX>width/2+100)||mouseY>=height-75-dudes.height/28) {//see if dude is suspended in air
      fly=false;
    } else {
      fly=true;
    }
    if (mouseX< fmrx) {
      reaversed=true;
    }
    if (mouseX> fmrx) {
      reaversed=false;
    }
  }
  imageMode(CENTER);
  if (mousePressed==false) {
    if (ready==false) {
      x =mouseX;
      y =mouseY;
    }
    if (reaversed==false) {
      if (fly==false) {
        image(dudesr, x, y, dudesr.width/-14, dudesr.height/14);
      } else {
        image(dudesfr, x, y, dudesfr.width/-14, dudesfr.height/14);
      }
    }
    if (reaversed==true) {
      if (fly==false) {
        image(dudes, x, y, dudes.width/-14, dudes.height/14);
      } else {
        image(dudesf, x, y, dudesf.width/-14, dudesf.height/14);
      }
    }
  }
  if (mousePressed) {
    if (ready==false) {
      x =mouseX;
      y =height-99;
    }
    if (reaversed==false) {
      image(dudesr, x, height-99, dudesr.width/-14, dudesr.height/14);
    }
    if (reaversed==true) {
      image(dudes, x, height-99, dudes.width/-14, dudes.height/14);
    }
  }
  fmrx = mouseX;
  imageMode(CENTER);
}
void smoke() {
  if (ready==false) {
    for (int c = smoke-1; c > 0; c--) {
      smokex[c] = smokex[c-1];
      smokey[c] = smokey[c-1];
    }
  }
  smokex[0] = width/2+50;
  smokey[0] = height-340;
  for (int c = 0; c < smoke; c++) {
    fill(255, 150);
    if (ready==true) {
      ellipse(smokex[c], smokey[c], c/2, c/2);
    }
    if (ready==false) {
      ellipse(smokex[c]+int(random(5)), smokey[c]+int(random(2)), c/2, c/2);
      smokey[c]=smokey[c]-int(random(9));
      smokex[c]=smokex[c]+int(random(20));
    }
  }
}
void walkers() {
  if (ready==false) {
    walker1=walker1 + walker1s;
    if (walker1<= -80) {
      walker1 = width+80;
    }
  }
  image(bike, walker1, height-100, bike.width/3.3, bike.height/3.3);
}
void house() {
  scale(1, 1);
  if ((width<oldwidth)|| (width>oldwidth)) {
    for (int i = num-1; i > 0; i--) {
      gx[i] = int(random(width));
      gy[i] = int(random(height-125, height-75));
      gt[i] = int(random(1, 7));
    }
    oldwidth =width;
  }
  stroke(6);
  noStroke();
  fill(#AF0003);
  rect(width/2, height-145, 45, 90);
  rectMode(CENTER);
  fill(11);
  triangle(width/2-120, height-275, width/2, height-365, width/2+120, height-275);
  rect(width/2+50, height-320, 30, 60);
  imageMode(CORNER);
  fill(#10CE00);
  rect(width/2, height-100, width, 50);
  for (int i = 0; i < num; i++) {
    fill(#0DAA00);
    noStroke();
    rect(gx[i], gy[i], 1, gt[i]);
  }
  image(brick, width/2-100, height-275, 200, 200 );
  imageMode(CENTER);
  image(door, width/2, height-124, door.width/6, door.height/6);
  //fill(#50DDFF);
  if (ready==false) {
    topw=int(random(235, 255)); //random color for window
  }
  fill(60, 203, topw );
  square(width/2-55, height-225, 40);
  square(width/2+55, height-225, 40);
  if (ready==false) {
    botw= int(random(200, 240));
  }
  fill(60, 203, botw );
  square(width/2-55, height-135, 40);
  square(width/2+55, height-135, 40);
  fill(#463334);
  rect(width/5, height-165, 16, 80);
  fill(#009301);
  ellipse(width/5, height-205, 180, 70);
}
void road() {
  fill(#818181);
  rect(width/2, height-62.5, width, 25);
  fill(#272727);
  rectMode(CENTER);
  rect(width/2, height-25, width, 50);
  m=50;
  while (m<width) {
    fill(#F2F702);
    rectMode(CENTER);
    rect(m, height-25, 30, 7);
    m=m+50;
  }
}
void backdrop() {
  background(#0DAEFC);
}
void death() {
  if (deaths>0) {
    textAlign(CENTER, CENTER);
    textSize(40);
    fill(60, 203, 220 );
    text(deaths, width-20, 20);
  }
  carend = carpos-112;
  carfront = carpos+100;
  cartop = height-50 - dudes.height/32;
  carbottom = height;
  if (carend<mouseX && mouseX<carfront) {
    if (  cartop< y && y <carbottom) {
      death=true;
      if (ready==false) {
        deaths =deaths+ 1;
        msg = int(random(info.length));
      }
      ready=true;
    }
  }
  if (death==true) {
    textAlign(CENTER, CENTER);
    fill(0, 0, 0, 155);
    rectMode(CORNER);
    rect(0, 0, width, height);
    rectMode(CENTER);
    fill(0, 0, 0, 255);
    fill(255);
    textSize(60);
    text("You were run over!", width/2, height/3);
    textSize(30);
    text("click to restart", width/2, height/3+60);
    text(info[int(msg)], width/2, height/3+100);
    if (mousePressed) {
      death=false;
      ready=false;
    }
  }
}
void car() {
  if (ready==false) {
    carpos=carpos +5;
    if (carpos>= width+180) {
      carpos = -180;
    }
  }
  image(car, carpos, height-55, car.width/1, car.height/1);
}
void clouds() {
  if (ready==false) {
    cloud1= cloud1 + cloud1s;
    if (cloud1>= width+180) {
      cloud1 = -180;
    }
    cloud2= cloud2 + cloud2s;
    if (cloud2>= width+180) {
      cloud2 = -180;
    }
    cloud3= cloud3 + cloud3s;
    if (cloud3>= width+180) {
      cloud3 = -180;
    }
  }
  fill(0, 0, 0, 255);
  noStroke();
  fill(67, 241, 255, 230);
  ellipse(cloud1+9, height/6-15, 132, 26);
  fill(229, 253, 255, 230);
  ellipse(cloud1, height/6, 200, 40);
  fill(#1FE0F0);
  fill(31, 224, 240, 230);
  ellipse(cloud2+11, height/7-20, 100, 20);
  fill(229, 253, 255, 230);
  ellipse(cloud2, height/7, 178, 43);
  fill(31, 224, 240, 230);
  ellipse(cloud3-17, height/8-30, 85, 34);
  fill(229, 253, 255, 230);
  ellipse(cloud3, height/8, 143, 50);
  fill(0, 0, 0, 255);
}
void sun() {
  if (ready==false) {
    sunc= int(random(234, 246));
  }
  fill(255, sunc, 31);
  circle(width/5*4, height/5, width/10);
}
void general() {
  if (frameCount<90) {
    background(#0DAEFC);
    fill(255);
    textSize(60);
    textAlign(CORNER);
    if (first==true) {
      if (third==0) {
        textSize(60);
        textAlign(CORNER);
        text("Loading", width/2-110, height/3);
        textSize(15);
        textAlign(CENTER);
        text("hold mouse to stay on sidewalk", width/2, height/3+25);
        first=false;
        third=1;
      }
    }
    if (first==true) {
      if (third==1) {
        textSize(60);
        textAlign(CORNER);
        text("Loading.", width/2-110, height/3);
        textSize(15);
        textAlign(CENTER);
        text("hold mouse to stay on sidewalk", width/2, height/3+25);
        third=2;
        first=false;
      }
    }
    if (first==true) {
      if (third==2) {
        textSize(60);
        textAlign(CORNER);
        text("Loading..", width/2-110, height/3);
        textSize(15);
        textAlign(CENTER);
        text("hold mouse to stay on sidewalk", width/2, height/3+25);
        third=3;
        first=false;
      }
    }
    if (first==true) {
      if (third==3) {
        textSize(60);
        textAlign(CORNER);
        text("Loading...", width/2-110, height/3);
        textSize(15);
        textAlign(CENTER);
        text("hold mouse to stay on sidewalk", width/2, height/3+25);
        third=0;
        first=false;
      }
    }
    first=true;
  }
}
