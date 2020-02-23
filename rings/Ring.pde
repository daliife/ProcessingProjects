class Ring{
  float value;
  float radius;
  float thickness;
  PVector rgb = new PVector(0.0,0.0,0.0); 
  PImage img;
  Scrollbar slider;
  
  Ring(float value, float radius, float thickness, PVector rgb){
    this.value = value;
    this.radius = radius;
    this.thickness = thickness;
    this.rgb = rgb;
    slider = new Scrollbar(width*3/4,random(100,height-100), width/5, 16, 10, rgb);
    img = loadImage("arrow.png");
  }
  
  void update(){
    updateRing();
    updateSlider();
  }

  void updateRing(){
   
    float val = -PI + value;
    float textSize = 20.0f;
    String r = nf(value, 1, 1);
    value = TWO_PI * 3 * slider.getPos();
    
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
    image(img, ((radius/2) * sin(-val)) - textSize, (radius/2) * cos(-val) - textSize ); 
    img.resize((int)textSize*2, (int)textSize*2);
    
    //Value indicator 
    fill(255); textSize(textSize);
    text(r.toString(), width/2*3/4 + width/12, -height/2 + slider.ypos + textSize*0.75);  
    
    translate(-width/2, -height/2);
    
  }
  
  void updateSlider(){
    slider.display();
    slider.update();
  }
  
}
