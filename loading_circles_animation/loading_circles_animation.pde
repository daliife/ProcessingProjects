
// -----------------------------------------
final int INIT_CIRCLES        = 50;
final float INIT_SIZE         = 50;
final float INIT_OFFSET       = 250;
final float INIT_SPEED        = 1;
final float INIT_WAVE_OFFSET  = 1;
// -----------------------------------------

int num_circles;
float circle_size, offset, speed, wave_offset, decalage, angle_division_to_rad = 360 / INIT_CIRCLES * TWO_PI/360;
long prev;
double delta, anim_tick = 0.0f;
HScrollbar hs1, hs2, hs3, hs4;

void setup(){
  colorMode(HSB, 100);
  size(800,600);
  hs1 = new HScrollbar(width*2/3,height/2-100, width/4, 16, 16);
  hs2 = new HScrollbar(width*2/3,height/2-50, width/4, 16, 16);
  hs3 = new HScrollbar(width*2/3,height/2, width/4, 16, 16);
  hs4 = new HScrollbar(width*2/3,height/2+50, width/4, 16, 16);
}

void draw(){
  
  //Framerate test and draw circles
  delta = (-prev + (prev = frameRateLastNanos))/1e6d;//println(delta, TAB, frameRate);
  drawCircles();
  
  //Update scrollbar UI
  translate(-width/4,-height/2);
  hs1.update();
  hs1.display();
  hs2.update();
  hs2.display();
  hs3.update();
  hs3.display();
  hs4.update();
  hs4.display();
    
  //Update values
  num_circles = (int)constrain(INIT_CIRCLES * hs4.getPos(), 5, INIT_CIRCLES);
  circle_size = constrain(INIT_SIZE * hs1.getPos(), 5, INIT_SIZE);
  offset = INIT_OFFSET;
  speed = INIT_SPEED * hs2.getPos();
  wave_offset = INIT_WAVE_OFFSET * hs3.getPos();
  angle_division_to_rad = 360/num_circles * TWO_PI/360;
  decalage = width/2 - circle_size/2 - offset;
  
  textSize(18);
  fill(0, 102, 153);
  text("Size", width*2/3 - 80,height/2 - 95);
  text("Speed", width*2/3 - 80,height/2 - 45);
  text("Offset", width*2/3 - 80,height/2 + 5);  
  text("Circles", width*2/3 - 80,height/2 + 55);
  fill(0, 0, 100,100);
  text(nf(circle_size, 0, 1), width*2/3 + 210,height/2 - 95);
  text(nf(speed, 0, 1), width*2/3 + 210,height/2 - 45);
  text(nf(wave_offset, 0, 1), width*2/3 + 210,height/2 + 5);
  text(nf(num_circles, 0, 0), width*2/3 + 210,height/2 + 55);
  
}

private void drawCircles(){
  
  background(0);
  translate(width/4,height/2);
  noStroke();
  
  for(int i = 0; i < num_circles; i++){
    
    //Animation tick
    anim_tick = anim_tick > 1.0f ? 0.0f : (anim_tick + speed * (delta/1000000));
    
    //Fill with color with lerp in HSB mode
    fill((i/(float)num_circles * 100),100,100);
    
    //Paint circle with certain parameters
    circle(decalage * sin(i * angle_division_to_rad),
           decalage * cos(i * angle_division_to_rad),
           circle_size + circle_size/2 * sin((float)anim_tick*360 + i*wave_offset));
  
  }
  
}
