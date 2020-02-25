Ring ring1, ring2, ring3;
float radius = 120.0f;
float thickness = radius/2;
float separation = 20.0f;
int maxCircles = 2;

void setup(){
  fullScreen();//size(854,480);
  ring1 = new Ring(0.0f,(radius+separation)  ,thickness, maxCircles, new PVector(255,0,0));
  ring2 = new Ring(1.0f,(radius+separation)*2,thickness, maxCircles, new PVector(0,255,0));
  ring3 = new Ring(2.0f,(radius+separation)*3,thickness, maxCircles, new PVector(0,0,255));
}

void draw(){
  background(0);
  ring1.update();
  ring2.update();
  ring3.update();
}
