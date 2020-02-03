// -----------------------------------------
final int OUTER_RADIUS           = 200;
final float INNER_RADIUS         = 50;
final float PERCENTAGE           = 1;
final float INITIAL_VALUE        = 0;
final float END_VALUE            = 2;
final float NUM_CIRCLES_ALLOWED  = 2;
// -----------------------------------------
float w =TAU/60;
HScrollbar ring_slider;
float ring_value;

void setup(){
  size(800,600);
  smooth(3);
  ring_value = PI;
  ring_slider = new HScrollbar(width*2/3,height/2, width/4, 8, 8);
}

void draw(){
  background(50);
  ring_slider.update();
  ring_slider.display(); 
  ring_value = TWO_PI * NUM_CIRCLES_ALLOWED * ring_slider.getPos();  
  drawCircles(); 
}

private void drawCircles(){
    
    //Arc draw
    translate(width/3, height/2);
    stroke(255,0,0);
    strokeWeight(INNER_RADIUS);
    noFill();
    arc(0, 0, OUTER_RADIUS, OUTER_RADIUS, -HALF_PI, -HALF_PI+ring_value);
        
    //Fake shadow draw
    stroke(0,0,0,100);
    arc(0, 0, OUTER_RADIUS, OUTER_RADIUS, -HALF_PI + ring_value, -HALF_PI + ring_value + 0.05);
        
    //Circle blocker draw
    stroke(255,0,0);
    arc(0, 0, OUTER_RADIUS, OUTER_RADIUS, -HALF_PI + ring_value - 0.05, -HALF_PI + ring_value);

}
