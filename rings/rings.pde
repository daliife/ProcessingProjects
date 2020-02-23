Ring ring, ring2, ring3;
float thickness = 60.0f;
float radius = 120.0f;

void setup(){
  //fullScreen();
  size(854,480);
  ring = new Ring(0.0f,(radius+10),thickness, new PVector(255,0,0));
  ring2 = new Ring(1.0f,(radius+10)*2,thickness, new PVector(0,255,0));
  ring3 = new Ring(2.0f,(radius+10)*3,thickness, new PVector(0,0,255));
}

void draw(){
  background(0);
  ring.update();
  ring2.update();
  ring3.update();
}
