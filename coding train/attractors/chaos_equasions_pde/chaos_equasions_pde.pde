double x = 0.01;
double y = 0.1;

double dx = 0.0;
double dy = 0.0;


double t = 0.0;
float hu = 0.0;
int n = 10000;
double dt = 0.0001;

PVector[] points;

float scale_ = 500.0;
float tr_x = 0;
float tr_y = 0;

void setup() {
  size(800, 800);
  colorMode(HSB);
}


void calc_array(double t, int n, float scale_) {
  
  double x = 0;
  double y = 0;
  
  double nx = 0.0;
  double ny = 0.0;
  
  points = new PVector[n];
  
  for (int i=0; i < n; i++) {
    nx = x*x-x*t+y*t-x;
    ny = -y*y-t*t-x*y-x*t-y*t-y;
    
    //nx = -x*x-x*t+y;
    //ny = x*x-y*y-t*t+x*y+y*t-x+y;
  
    x = nx;
    y = ny;
    //z = z + dz;
    
    points[i] = new PVector((float) (x+tr_x)*scale_, (float) (y+tr_y)*scale_);
  }
}

void handle_keys() {
  if (keyPressed) {
    switch (key) {
      case '-':
        scale_ *= 0.9;
        break;
      case '=':
        scale_ /= 0.9;
        break;
    }
    
    switch (keyCode) {
      case LEFT:
        tr_x += 0.008;
        break;
      case RIGHT:
        tr_x -= 0.008;
        break;
      case UP:
        tr_y += 0.008;
        break;
      case DOWN:
        tr_y -= 0.008;
        break;
      case SHIFT:
        dt *= 0.95;
        break;
      case CONTROL:
        dt /= 0.95;
        break;
    }
  }
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  //scale(2);
  handle_keys();
  
  t += dt;
  stroke(255);
  //scale_(5);
  
  calc_array(t, n, scale_);
  hu = 0.0;
  
  for (int i=0; i<n; i++){
    PVector v = points[i];
    stroke(hu, 255, 255);
    point(v.x, v.y);
    hu += 0.1;
    if (hu > 255) {
      hu = 0.0;
    }
  }
}
