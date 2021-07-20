import peasy.*;

double x = 0.01;
double y = 0.1;
double z = 0.2;

double dx = 0.0;
double dz = 0.0;
double dy = 0.0;

//float a = 10.0;
//float b = 28.0;
//float c = 8.0/3.0;

//-5.8001714 59.600723 18.466995



float a = -5.8001714;
float b = 59.600723;
float c = 18.466995;


float dt = 0.001;
float hu = 0.0;

ArrayList<PVector> points = new ArrayList<PVector>();



PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 500);
  colorMode(HSB);
  frameRate(400);
}

void draw() {
  background(0);
  dx = a * (y-x) * dt;
  dz = (x*y - c*z) * dt;
  dy = (x*(b - z)-y) * dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  points.add(new PVector((float) x, (float) y, (float) z));
  
  translate(0, 0, -80);
  //translate(width/2, height/2);
  //stroke(255);
  //scale(5);
  
  hu = 0.0;
  
  noFill();
  beginShape();
  for (PVector v: points) {
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    hu += 0.1;
    if (hu > 255) {
      hu = 0.0;
    }
  }
  endShape();
  //println(x, y, z);
}
