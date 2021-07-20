float angle = 0;

PVector[] points = new PVector[8];



void setup() {
  size(600, 400, P2D);
  
  for (int i=0; i<2; i++) {
    for (int j=0; j<2; j++) {
      for (int k=0; k<2; k++) {
        points[i + 2*j + 4*k] = new PVector(i-0.5, j-0.5, k-0.5);
      }
    }
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(1);
  noFill();
  
  float[][] rot_z = {
      {cos(angle), -sin(angle), 0},
      {sin(angle),  cos(angle), 0},
      {         0,           0, 1}
    };
    
  float[][] rot_y = {
    {cos(angle), 0, -sin(angle)},
    {         0, 1,           0},
    {sin(angle), 0,  cos(angle)}
    
  };
    
  float[][] rot_x = {
    {1,          0,           0},
    {0, cos(angle), -sin(angle)},
    {0, sin(angle),  cos(angle)}
  };
  
  PVector[] pr2d = new PVector[8];
  int ind=0;
  for (PVector v : points) {
    PVector rotated   = matmul(rot_x, v);
    rotated   = matmul(rot_y, rotated);
    rotated   = matmul(rot_z, rotated);
    float distance = 2 + angle;
    float z = 1 / (distance - rotated.z);
    float[][] proj = {
      {z,0,0},
      {0,z,0}
    };
    
    PVector proj2d = matmul(proj, rotated);
    proj2d.mult(200);
    pr2d[ind] = proj2d;
    ind++;  
  }
  
  connect(0,1, pr2d);
  connect(0,2, pr2d);
  connect(0,4, pr2d);
  connect(1,3, pr2d);
  connect(1,5, pr2d);
  connect(4,5, pr2d);
  connect(4,6, pr2d);
  connect(5,7, pr2d);
  connect(2,6, pr2d);
  connect(2,3, pr2d);
  connect(3,7, pr2d);
  connect(6,7, pr2d);
  
  for (PVector v: pr2d) {
    point(v.x, v.y);
  }
  
  angle += 0.01;
}

void connect(int i, int j, PVector[] arr) {
  PVector a = arr[i];
  PVector b = arr[j];
  strokeWeight(1);
  line(a.x, a.y, b.x, b.y);
}
