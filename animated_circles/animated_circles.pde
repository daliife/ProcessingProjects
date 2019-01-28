//inspiration link - https://9gag.com/gag/a83oYpQ

int num_circles;
int size_circles;
int size_circles_extern;
float radius;
float hue_offset = 0.0f;
float hue_offset_secondary = 0.0f;
float rotation_speed = 0.25f;
boolean rotation_clockwise = true;

void setup(){
  size(512, 512);
  colorMode(HSB, 100);
  frameRate(20);
  num_circles = 24;
  size_circles = 30;
  size_circles_extern = 135;
  radius = 120;
}

void draw(){
  background(0);
  translate(width/2,height/2);
  drawSecondaryCircles();  
  drawPrimaryCircles();
}

void drawPrimaryCircles(){
  
  float hue;
  for (int i = 0; i < num_circles; i++){   
    hue = (i + hue_offset) * 100 / num_circles;
    if(hue > 100) hue = hue - 100;
    if(hue < 0) hue = 100 + hue;
    fill(hue,100,100);
    noStroke();
    pushMatrix();
    rotate(radians(i * 360 / num_circles));
    ellipse(radius, radius, size_circles, size_circles);
    popMatrix();
  }

  //Update hue offset value
  hue_offset = rotation_clockwise ? hue_offset - rotation_speed : hue_offset + rotation_speed;
   
  //Offset reset check
  if(abs(hue_offset) > num_circles) hue_offset = 0;
  
}

void drawSecondaryCircles(){
      
  float hue;
  for ( int i = 0; i < num_circles/2; i++){     
    hue = (i + hue_offset_secondary) * 100 / (num_circles*0.5);
    if(hue > 100) hue = hue - 100;
    if(hue < 0) hue = 100 + hue;
    pushMatrix();
    noFill();
    stroke(hue,100,100,50);
    strokeWeight(2);
    float offset = 0.125; //hardcoded but sure it has math. reason
    rotate(radians((i * 720 / num_circles)) + offset);
    ellipse(radius,radius, size_circles_extern, size_circles_extern);
    popMatrix();
  }
  
  //Update hue offset value
  hue_offset_secondary = rotation_clockwise ? hue_offset_secondary - rotation_speed/2 : hue_offset_secondary + rotation_speed/2;
   
  //Offset reset check
  if(abs(hue_offset_secondary) > num_circles/2) hue_offset_secondary = 0;
  
}
