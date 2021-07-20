byte[] grid, next;
byte[] rules;
int[] colors;

ArrayList<String> rule_file = new ArrayList<String>();

int states=2, numberToChoose, neibs=4;
int fps = 200, tfps;

int cols, rows, res = 1;
boolean doted = false;

int time_ = 0;

// =======================================================================================

void setup() {
  preload_rule_file();
  
  tfps = fps;
  
  background(0);
  colorMode(HSB);
  fullScreen();
  //size(800, 800);
  frameRate(fps);

  cols = floor(width / res);
  rows = floor(height / res);
  
  rules = getInitArray_2(false);
  
  colors = new int[states];
  for (int i=0; i<states; i++) {
    float c = (float) i/(states-1);
    colors[i] = floor(30 + 300 * (pow(c, 1)));
  }

  grid = new byte[cols];
  
  int dw = 0;
  if (doted) {
    grid[floor(cols/2)] = (byte) floor(random(0, states));
  } else {
    for (int i = dw; i < cols-dw; i++) {
      grid[i] = (byte) floor(random(states));
    }
  }
  //println(states);
  //println(str(getInitArray_2(false)));
}


// =======================================================================================


void reinit_screen() {
  //noLoop();
  background(0);
  time_ = 0;
  rules = getInitArray_2(true);
  grid = new byte[cols];
  for (int i=0; i<grid.length; i++){
    grid[i] = (byte) (states-1);
  }
  if (doted) {
    //grid[floor(cols/2)] = floor(random(1, states));
    grid[floor(cols/2)] = 0;
  } else {
    for (int i = 0; i < cols; i++) {
      grid[i] = (byte) floor(random(states));
    }
  }
}

void draw() {
  // --------------------------------
  if (time_ > rows) {
    reinit_screen();
  }
  // ------------------------------
  for (int i = 0; i < cols; i++) {
    int val = grid[i];
    if (val > 0){
      stroke(colors[val], 255, 255);
      fill(colors[val], 255, 255);
      rect(i * res, time_ * res, res-1, res-1);
    }
  }
  // -------------------------------
  
  int c=floor(neibs/2);
  next = new byte[cols];
  for (int i=c; i<cols-c; i++) {
    next[i] = rules[floor(pow(states, neibs))-1-getCurState(i)];
  }
  for (int i=0; i<c; i++){
    next[i] = rules[floor(pow(states, neibs))-1-getCurStateBorder(i)];
    next[cols-i-1] = rules[floor(pow(states, neibs))-1-getCurStateBorder(cols-i-1)];
  }
  
  grid = next;
  time_ += 1;
}
