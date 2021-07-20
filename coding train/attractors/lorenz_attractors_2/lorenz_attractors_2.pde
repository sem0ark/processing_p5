import peasy.*;

float dt = 0.01;
float hu = 0.0;

float a = 10.0;
float b = 28.0;
float c = 8.0/3.0;

PVector[] points;

PeasyCam cam;

void calc_array(float a, float b, float c, float dt, int n) {
  
  double x = 0.01;
  double y = 0.02;
  double z = 0.01;
  
  double dx = 0.0;
  double dz = 0.0;
  double dy = 0.0;
  
  points = new PVector[n];
  
  for (int i=0; i<n; i++) {
    dx = a * (y-x) * dt;
    dz = (x*y - c*z) * dt;
    dy = (x*(b - z)-y) * dt;
  
    x = x + dx;
    y = y + dy;
    z = z + dz;
    
    points[i] = new PVector((float) x, (float) y, (float) z);
  }
  
  if (keyPressed) {
    if (key == 'w') {
      println(a, b, c);
    }
  }
  
  //println("count");
}

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(HSB);
  frameRate(300);
  
}

void draw() {
  background(0);
  
  calc_array(a, b, c, 0.001, 20000);
  a -= 0.01;
  b += 0.02;
  c += 0.01;
  
  translate(0, 0, -80);
  hu = 0.0;
  noFill();
  beginShape();
  for (int i=0; i<points.length; i++) {
    PVector v = points[i];
    
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    hu += 0.1;
    if (hu > 255) {
      hu = 0.0;
    }
  }
  endShape();
  
  //println(points.length);
}
