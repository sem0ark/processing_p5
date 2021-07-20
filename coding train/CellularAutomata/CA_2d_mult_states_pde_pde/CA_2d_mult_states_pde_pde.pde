
byte[][] grid, next;
int cols, rows, res = 2;

int states;

int counter = 0;
int step = 2;
int numberToChoose;

int sw=1, sh=1;

ArrayList<String> rule_file = new ArrayList<String>();

byte[] rules;
int[] colors;

int[] neib_coefs = {2, 2, 2, 2, 0};

void setup() {
  size(800, 800);
  colorMode(HSB);
  //fullScreen();
  frameRate(200);
  
  cols = floor(width / res);
  rows = floor(height / res);
  
  grid = new byte[cols][rows];
  rules = loadRules(false);
  preload_rule_file();
  
  clear_grid();
  
  colors = new int[states];
  for (int i=0; i<states; i++) {
    float c = (float) i/(states-1);
    colors[i] = floor(30 + 300 * (pow(c, 1)));
  }
}

void clear_grid() {
  for (int i=cols/2 - sw/2 - 1; i < cols/2 + sw/2;i++){
    for (int j=rows/2 - sh/2 - 1; j < rows/2 + sh/2;j++){
      grid[i][j] = (byte) (states-1);
    }  
  }
}

void draw() {
  counter += 1;
  if (counter > 4202500) {counter = 0;};
  
  // ------------------
  if (counter % step == 0) {
    background(0);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int val = grid[i][j];
        if (val > 0) {
          stroke(colors[val], 255, 255);
          fill(colors[val], 255, 255);
          rect(i * res, j * res, res-1, res-1);
        }
      }
    }
  }
  // ------------------
  
  //create new population
  byte[][] next = new byte[cols][rows];
  // count without borders
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      //next[i][j] = (byte) rules[rules.length - 1 - getCurState(i, j)];
      next[i][j] = (byte) rules[getCurState(i, j)];  
    }
  }
  
  // count  throught borders
  for (int i=0; i < cols; i++) {
    int n = getCurStateBorder(i, 0);
    //next[i][0] = rules[rules.length - 1 - n];
    next[i][0] = rules[n];
    n = getCurStateBorder(i, rows-1);
    //next[i][rows-1] = rules[rules.length - 1 - n];
    next[i][rows-1] = rules[n];
  }
  
  for (int j=1; j < rows-1; j++) {
    int n = getCurStateBorder(0, j);
    //next[0][j] = rules[rules.length - 1 -n];
    next[0][j] = rules[n];
    n = getCurStateBorder(cols-1, j);
    //next[cols-1][j] = rules[rules.length - 1 - n];
    next[cols-1][j] = rules[n];
  }

  grid = next;
}
