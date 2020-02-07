 class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    print(ratio);
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = 10;//l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
 
    //Back line
    stroke(255);
    strokeWeight(4);
    //line(xpos+sheight/2, ypos+sheight/2, xpos+swidth-sheight/2, ypos+sheight/2);
    
    //Slider zone
    noStroke();
    fill(255,0,0);
    rect(xpos, ypos, swidth, sheight);
    
    //Slider handle
    if (over || locked) 
      fill(102, 102, 102);      
    else
      fill(0, 0, 0);

    stroke(255);
    strokeWeight(4);
    circle(spos, ypos+sheight/2, sheight);
     
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    print((float)abs(spos-xpos)/(float)swidth, TAB, (float)abs(spos-xpos), TAB, (float)swidth, "\n");
    return abs(spos-xpos)/swidth;
  }
}
