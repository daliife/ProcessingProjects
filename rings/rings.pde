Ring ring;

void setup(){
  //fullScreen();
  size(854,480);
  ring = new Ring(0.0f,250,50, new PVector(0,255,0));
}

void draw(){
  background(0);
  ring.update();
}
