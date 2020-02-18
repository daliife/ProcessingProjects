class Ring{
  
  //Ring variables
  float value;
  float radius;
  float thickness;
  PVector rgb = new PVector(0.0,0.0,0.0); 
  
  //Scrollbar variables
  Scrollbar slider;
  PImage img;
  
  Ring(float value, float radius, float thickness, PVector rgb){
    this.value = value;
    this.radius = radius;
    this.thickness = thickness;
    this.rgb = rgb;
    slider = new Scrollbar(width - width/3,random(0,height), width/5, 16, 1);
    img = loadImage("arrow.png");
  }
  
  void update(){
    updateSlider();
    updateRing();
  }

  void updateRing(){
    
    value = TWO_PI * 3 * slider.getPos();
    
    float val = -PI + value;
    float textSize = 14.0f;
    String r = nf(value, 1, 1);
    float rw = textWidth(r);
    translate(width/2, height/2);
    
    //Shadow arc
    stroke(128,128,128, 50); strokeWeight(thickness); noFill();
    arc(0, 0, radius, radius, -HALF_PI, -HALF_PI + TWO_PI);
    
    //Main arc
    stroke(rgb.x, rgb.y, rgb.z); strokeWeight(thickness); noFill();
    arc(0, 0, radius, radius, -HALF_PI, -HALF_PI + value);
        
    //Fake shadow draw
    stroke(0,0,0,100); noFill();
    arc(0, 0, radius, radius, -HALF_PI + value, -HALF_PI + value + 0.05);
               
    //Circle blocker draw
    fill(rgb.x, rgb.y, rgb.z); noStroke();
    circle((radius/2) * sin(-val), (radius/2) * cos(-val), thickness);

    //Icon indicator
    tint(255, 255); 
    //image(img, -textSize, -(radius/2) - textSize ); 
    image(img, ((radius/2) * sin(-val)) - textSize, (radius/2) * cos(-val) - textSize ); 
    img.resize((int)textSize*2, (int)textSize*2);
    
    //Value indicator 
    //fill(0); textSize(textSize);
    //text(r, ((radius/2) * sin(-val)) - rw/2, (radius/2) * cos(-val) + textSize/4 );  
  
  }
  
  void updateSlider(){
    slider.display();
    slider.update();
  }
  
}
