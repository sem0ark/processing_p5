float[] grid, next;
int[] colors;

double A, B;

int states, numberToChoose;

int cols, rows, res = 4;
int stepSize;
boolean doted = true;

int time_ = 0;

float rule(double val) {
  float res = (float) (A * val + B);
  while (res > 1.0) {res -= 1.0;}
  while (res < 0.0) {res += 1.0;}
  return res;
}

void setup() {
  background(0);
  colorMode(HSB);
  //fullScreen();
  size(600, 1000);  
  frameRate(2000);
  
  stepSize = (int) width/2;
  //stepSize = 1;
  
  cols = floor(width / res);
  rows = floor(height / res);

  A = 3/2;
  B = 0.008;

  grid = new float[cols];
  
  int dw = 0;
  if (doted) {
    grid[floor(cols/2)] = 1;
  } else {
    for (int i = dw; i < cols-dw; i++) {
      grid[i] = floor(random(states));
    }
  }
}

void draw() {
  //--------------------------------
  if (time_ > rows) {
    background(0);
    time_ = 0;
    grid = new float[cols];
    //A *= 1.001;
    B += 0.0001;
    
    if (doted) {
      grid[floor(cols/2)] = 1;
    } else {
      for (int i = 0; i < cols; i++) {
        grid[i] = random(1);
      }
    }
    println(A, B);
  }
  
  //// ------------------------------
  //for (int i = 0; i < cols; i++) {
  //  float val = 1-grid[i];
  //  stroke(255*val);
  //  fill(255*val);
  //  rect(i * res, time_ * res, res-1, res-1);
  //}
  //// -------------------------------
  
  //next = new float[cols];
  //for (int i=1; i<cols-1; i++) {
  //  next[i] = getNewState(i);
  //}
  //next[0] = getNewStateBorder(0);
  //next[cols-1] = getNewStateBorder(cols-1);
  
  //grid = next;
  //time_ += 1;
  
  loop_draw(stepSize);
}


void loop_draw(int n) {
  for(int step=0; step<n; step++) {
    // ------------------------------
    for (int i = 0; i < cols; i++) {
      float val = 1-grid[i];
      stroke(255*val);
      fill(255*val);
      rect(i * res, time_ * res, res-1, res-1);
    }
    // -------------------------------
    
    next = new float[cols];
    for (int i=1; i<cols-1; i++) {
      next[i] = getNewState(i);
    }
    next[0] = getNewStateBorder(0);
    next[cols-1] = getNewStateBorder(cols-1);
    
    grid = next;
    time_ += 1;
  }
}

float getNewState(int x) {
  float l = grid[x-1];
  float c = grid[x];
  float r = grid[x+1];
  
  return (rule((l+c+r)/3.0));
}

float getNewStateBorder(int x) {
  float l = grid[(x-1 + cols) % cols];
  float c = grid[x];
  float r = grid[(x+1 + cols) % cols];
  
  return (rule((l+c+r)/3.0));
}
