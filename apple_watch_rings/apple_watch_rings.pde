PImage img;
Ring ring1, ring2, ring3;
float radius = 70.0f;
float thickness = radius/2.5;
float separation = 2.5f;
int maxCircles = 2;

void setup(){
  size(800,600);
  ring1 = new Ring(0.0f,(radius+separation)*2  ,thickness, maxCircles, new PVector(255,0,0));
  ring2 = new Ring(1.0f,(radius+separation)*3,thickness, maxCircles, new PVector(0,255,0));
  ring3 = new Ring(2.0f,(radius+separation)*4,thickness, maxCircles, new PVector(0,0,255));
  img = loadImage("mockup.png");
}

void draw(){
  drawDecorations();
  ring1.update();
  ring2.update();
  ring3.update();
}

void drawDecorations(){
  background(0);
  image(img,2.5,0);
  fill(255);
  textSize(28);
  text("Activity", width/2-170,height/2-180);
  String r = nf(hour(),1,0) + ":" + nf(minute(),1,0);  
  text(r, width/2+75,height/2-180);
}
