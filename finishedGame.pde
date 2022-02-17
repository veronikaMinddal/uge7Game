/*

Jeg har valgt at lave et simpelt spil, men selvopfundet spil!

Spillet går ud på at at bolden Rollo skal spise farver på tid.
Jo hurtigere han spiser, jo hurtigere vokser han,
men hvis han er for langsomt skrumper han.
Hvis Rollo skrumper for meget eller spiser en forkert farver bliver han syg 
og grå, og så er spillet tabt.
Hvis Rollo spiser 20 farver bliver han til guld og spillet er vundet!!
Man styrer på taster A,S,D og W
A for rød, S for blå, D for grøn og W for gul.

Held og lykke!! :)

*/

//variables
int pointScore = 0;
int ballNumber;
int expandPlayer = 100;
int expandPoint = 20;
int decreasePoints = 0;
int levelUp = 0;

//colors
color green = color(0,255,0);
color blue = color(0,0,255);
color yellow = color(255,255,0);
color red = color(255,0,0);
color grey = color(150,150,150);
color gold = color(230,190,0);
color ballColor;

//functions

int getBallNumber(){
ballNumber = (int) Math.ceil(random(4));
return ballNumber;
}
color getBallColor(){
  if (ballNumber == 1){
    ballColor = green;
  } else if(ballNumber == 2){
   ballColor = yellow;
  } else if(ballNumber == 3){
   ballColor = red;
  } else if(ballNumber == 4){
   ballColor = blue;
  } else {
    ballColor = grey;
  }
  return ballColor;
}


//background
void setup() {
    size(500, 500);
    background(0);
    getBallNumber();
    getBallColor();
    frameRate(10);
}

void draw() {
  //triangle background
    noStroke();
    fill(yellow);
    triangle(0, 0, 250, 250, 500, 0);
    fill(red);
    triangle(0, 0, 250, 250, 0, 500);
    fill(green);
    triangle(500, 500, 250, 250, 500, 0);
        fill(blue);
    triangle(500, 500, 250, 250, 0, 500);
    
      //round player
  fill(ballColor);
  ellipseMode(CENTER);
  stroke(0);
  ellipse(250,250,expandPlayer - decreasePoints ,expandPlayer - decreasePoints);
  fill(0);
  ellipse (250,260, (expandPlayer - decreasePoints)/2 - 30, 30);
  fill(255);
  ellipse (250-(expandPlayer - decreasePoints-30)/2 ,230, 30, 30);
  ellipse (250+(expandPlayer - decreasePoints-30)/2 ,230, 30, 30);
  fill (0);
  ellipse (250-(expandPlayer - decreasePoints-30)/2 ,230, 10, 10);
  ellipse (250+(expandPlayer - decreasePoints-30)/2 ,230, 10, 10);
  
  
  //pointsystem
  if (decreasePoints > expandPlayer || ballColor == grey){
    expandPlayer = 200;
    decreasePoints = 100;
    ballColor = grey;
    } else if (levelUp > 20){
    expandPlayer = 500;
    decreasePoints = 100;
    ballColor = gold;
    fill (0);
    ellipse(250,260,(expandPlayer - decreasePoints)/2+50, 200);
    fill (gold);
    noStroke();
    ellipse(250,200,(expandPlayer - decreasePoints)/2 +100, 200);
    stroke(0);
    fill(255);
    ellipse (250-(expandPlayer - decreasePoints-50)/2 ,200, 100, 100);
    ellipse (250+(expandPlayer - decreasePoints-50)/2 ,200, 100, 100);
    fill (0);
    ellipse (250-(expandPlayer - decreasePoints-50)/2 ,200, 50, 50);
    ellipse (250+(expandPlayer - decreasePoints-50)/2 ,200, 50, 50);
  }else if (levelUp > 15){
    decreasePoints++;
    decreasePoints++;
    decreasePoints++;
    decreasePoints++;
  } else if (levelUp > 10){
    decreasePoints++;
    decreasePoints++;
    decreasePoints++;
  } else if (levelUp > 5){
    decreasePoints++;
    decreasePoints++;
  } else {
    decreasePoints++;
  }
  
 
}
//controls
void keyPressed() {
  switch(key) {
  case 'd': 
    if(ballNumber == 1){
      expandPlayer = expandPlayer + expandPoint;
      getBallNumber();
      getBallColor();
      levelUp++;
    } else {
      ballNumber = 0;
      expandPlayer = 0;
      getBallColor();
      
    }
    break;
  case 'w': 
    if(ballNumber == 2){
      expandPlayer = expandPlayer + expandPoint;
      getBallNumber();
      getBallColor();
      levelUp++;
    } else {
      ballNumber = 0;
      expandPlayer = 0;
      getBallColor();
    }
    break;
  case 'a':
    if(ballNumber == 3){
      expandPlayer = expandPlayer + expandPoint;
      getBallNumber();
      getBallColor();
      levelUp++;
    } else {
      ballNumber = 0;
      expandPlayer = 0;
      getBallColor();
    }
    break;
  case 's': 
    if(ballNumber == 4){
      expandPlayer = expandPlayer + expandPoint;
      getBallNumber();
      getBallColor();
      levelUp++;
    } else {
      ballNumber = 0;
      expandPlayer = 0;
      getBallColor();
    }
    break;
  default:
    break;
}
}
