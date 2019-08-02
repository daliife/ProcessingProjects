class Spring { 
  // Screen values 
  float xpos, ypos;
  float tempxpos, tempypos; 
  int size = 20; 
  float rotation = 0;
  float timer = 1.0f;

  // Spring simulation constants 
  float mass;       // Mass 
  float k = 0.2;    // Spring constant 
  float damp;       // Damping 
  float rest_posx;  // Rest position X 
  float rest_posy;  // Rest position Y 

  // Spring simulation variables 
  //float pos = 20.0; // Position 
  float velx = 0.0;   // X Velocity 
  float vely = 0.0;   // Y Velocity 
  float accel = 0;    // Acceleration 
  float force = 0;    // Force 

  Spring[] friends;
  int me;

  // Constructor
  Spring(float x, float y, float xi, float yi, int s, float d, float m, 
  float k_in, Spring[] others, int id, float rot, float time) { 
    xpos = tempxpos = x; 
    ypos = tempypos = y;
    rest_posx = xi;
    rest_posy = yi;
    size = s;
    damp = d; 
    mass = m; 
    k = k_in;
    friends = others;
    me = id;
    rotation = rot;
    timer = time;
  } 

  void update() {    
    
    if(timer > 0){
      timer -= 0.01;
    }else{
   
      force = -k * (tempypos - rest_posy);  // f=-ky 
      accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
      vely = damp * (vely + accel);         // Set the velocity 
      tempypos = tempypos + vely;           // Updated position 
      
      force = -k * (tempxpos - rest_posx);  // f=-ky 
      accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
      velx = damp * (velx + accel);         // Set the velocity 
      tempxpos = tempxpos + velx;           // Updated position 
    
    }
  } 

  void display() {
    pushMatrix();
    fill(0);
    noStroke();
    rotate(rotation);
    ellipse(tempxpos, tempypos, size, size);
    popMatrix();
  } 

}
