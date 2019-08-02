//inspiration link - https://9gag.com/gag/aro1gOd

final int SPHERE_DIAMETER = 400;
final int NUM_DIVISIONS = 8;
final int circleRadius = 14;
float angle = 0.0f;
float delay = 0.0f;
Spring[] springs = new Spring[NUM_DIVISIONS]; 

void setup(){
  size(512, 512);
  angle = 0.0f;
  for(int i = 0; i < NUM_DIVISIONS; i++){
    angle = i * TWO_PI / (2 * NUM_DIVISIONS);
    delay = i * (float)1/((NUM_DIVISIONS-1.5)*2);
    springs[i] = new Spring(SPHERE_DIAMETER/2 - circleRadius, 0, 0, 0, circleRadius*2, 1, 40.0, 0.1, springs, 0, angle, delay);
  }
}
  
void draw(){
  drawBackground();
  drawCircles();
  drawGrid();
}

void drawBackground(){
  translate(width/2,height/2);
  background(0,0,0);
  noStroke();
  fill(0,255,0);
  ellipse(0,0, SPHERE_DIAMETER + 15,SPHERE_DIAMETER + 15);
  fill(255,0,0);
  ellipse(0,0, SPHERE_DIAMETER,SPHERE_DIAMETER);
}

void drawCircles(){
  for (Spring spring : springs) { 
    spring.update(); 
    spring.display();
  }
}

void drawGrid(){
  stroke(0,0,0); strokeWeight(1);
  angle = 0.0f;
  for(int i = 0; i < NUM_DIVISIONS * 2; i++){
    angle = i * (TWO_PI / (2 * NUM_DIVISIONS));
    rotate(angle);
    line(0,0,SPHERE_DIAMETER,0);
  }
}
