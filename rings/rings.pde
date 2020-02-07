// -----------------------------------------
final int OUTER_RADIUS           = 250;
final float INNER_RADIUS         = 50;
final float PERCENTAGE           = 1;
final float INITIAL_VALUE        = 0;
final float END_VALUE            = 2;
final float NUM_CIRCLES_ALLOWED  = 2;
// -----------------------------------------

float w =TAU/60;
HScrollbar ring_slider;
float ring_value;
PImage img;

void setup(){
  size(800,600);
  //fullScreen();
  smooth(16);
  noStroke();
  ring_slider = new HScrollbar(width*2/3,height/2, width/4, 16, 32);
  ring_value = 0.0f;
  img = loadImage("arrow_1.png");
}

void draw(){
  background(0);
  ring_slider.update();
  ring_slider.display(); 
  ring_value = (TWO_PI * NUM_CIRCLES_ALLOWED * ring_slider.getPos());
  //ring_value = ring_value - ring_value%0.1; //ROUNDING, BUT PROBLEM IS SCROLLBAR
  print(ring_slider.getPos(), "\n");
  drawCircles(); 
}

private void drawCircles(){
    
    translate(width/3, height/2);
    
    //Shadow arc
    stroke(100,100,100, 100);
    strokeWeight(INNER_RADIUS);
    noFill();
    arc(0, 0, OUTER_RADIUS, OUTER_RADIUS, -HALF_PI, -HALF_PI + TWO_PI);
    
    //Main arc
    stroke(255,0,0);
    strokeWeight(INNER_RADIUS);
    noFill();
    arc(0, 0, OUTER_RADIUS, OUTER_RADIUS, -HALF_PI, -HALF_PI + ring_value);
        
    //Fake shadow draw
    stroke(0,0,0,100);
    noFill();
    arc(0, 0, OUTER_RADIUS, OUTER_RADIUS, -HALF_PI + ring_value, -HALF_PI + ring_value + 0.05);
        
     float val = -PI + ring_value;
        
    //Circle blocker draw
    fill(255,0,0);
    noStroke();
    circle((OUTER_RADIUS/2) * sin(-val), (OUTER_RADIUS/2) * cos(-val), INNER_RADIUS);
    
    //Value indicator 
    fill(0);
    float textSize = 16.0f;
    textSize(textSize);
    String r = nf(ring_value, 1, 1);
    float rw = textWidth(r);
    text(r, ((OUTER_RADIUS/2) * sin(-val)) - rw/2, (OUTER_RADIUS/2) * cos(-val) + textSize/4 ); 
    
    //Icon indicator
    //image(img, ((OUTER_RADIUS/2) * sin(-val)) - textSize, (OUTER_RADIUS/2) * cos(-val) - textSize ); 
    //img.resize((int)textSize*2, (int)textSize*2);

}
