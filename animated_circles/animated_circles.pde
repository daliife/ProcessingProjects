//inspiration link - https://9gag.com/gag/a83oYpQ

final int INIT_CIRCLES = 48;
final float INIT_SIZE = 60;
final float INIT_SIZE_OUTSIDE = 135;
final float INIT_RADIUS = 240;

int num_circles;
float radius, hue_offset = 0.0f, hue_offset_secondary = 0.0f, rotation_speed = 0.25f,size_circles, size_circles_extern;
boolean rotation_clockwise = true;
HScrollbar hs1, hs2, hs3;

void setup(){
  size(800, 600);
  colorMode(HSB, 100);
  frameRate(20);
  
  num_circles = INIT_CIRCLES; 
  size_circles = INIT_SIZE;
  size_circles_extern = INIT_SIZE_OUTSIDE;
  radius = INIT_RADIUS;

  hs1 = new HScrollbar(width*2/3,height/2-100, width/4, 16, 16);
  hs2 = new HScrollbar(width*2/3,height/2, width/4, 16, 16);
  hs3 = new HScrollbar(width*2/3,height/2+100, width/4, 16, 16);

}

void draw(){
  background(0);
  hs1.update();
  hs1.display();
  hs2.update();
  hs2.display();
  hs3.update();
  hs3.display();
  
  num_circles = (int)constrain(INIT_CIRCLES * hs1.getPos(), 5, INIT_CIRCLES);
  size_circles = constrain(INIT_SIZE * hs2.getPos(), 5, INIT_SIZE);
  radius = constrain(INIT_RADIUS * hs3.getPos(), 5, INIT_RADIUS);
  
  textSize(20);
  fill(0, 102, 153);
  text("Circles", width*2/3 - 80,height/2 - 100);
  text("Size", width*2/3 - 80,height/2 );
  text("Offset", width*2/3 - 80,height/2 + 100);  
  text(nf(num_circles, 0, 1), width*2/3 + 210,height/2 - 95);
  text(nf(size_circles, 0, 1), width*2/3 + 210,height/2 );
  text(nf(radius, 0, 1), width*2/3 + 210,height/2 + 95);
  
  translate(width/3,height/2);
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


//float radius1 = 100, size_circles1 = 300, size_circles2 = 50;

//float value = 0;

//void setup(){
//  size(800, 600);
//  colorMode(HSB, 100);
//  //frameRate(20);
//}

//void draw(){
//    background(0);
//    translate(width/2,height/2);

//    //Outline circle
//    fill(100,100,100);
//    stroke(255);
//    ellipse(0, 0, size_circles1, size_circles1);

//    //Circles animation
//    fill(25,100,100);
//    noStroke();
//    ellipse(0,0,size_circles2, size_circles2);
  
//}
