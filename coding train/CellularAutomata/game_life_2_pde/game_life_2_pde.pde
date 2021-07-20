
byte[][] grid, next;
int lifeLimit;
int cols, rows, res = 1;

int counter = 0;
int step = 1;
int numberToChoose;

byte[][] rules;
int[] colors;

void setup() {
  size(800, 1000);
  colorMode(HSB);
  //fullScreen();
  
  frameRate(100);
  
  cols = floor(width / res);
  rows = floor(height / res);
  
  grid = make2DArray(cols, rows);
  rules = loadRules();
  lifeLimit = rules.length - 2;
  
  for (byte[] t: rules) {
    println(str(t));
  }
  println();
  
  //int dw = 800/4;
  //int dh = 400/4;
  
  int dw=cols/3, dh=rows/3;
  
  for (int i = dw; i < cols-dw; i++) {
    for (int j = dh; j < rows-dh; j++) {
      grid[i][j] = (random(2)<=1)? (byte) (rules.length - 1) : 0;
    }
  }
  
  colors = new int[rules.length];
  for (int i=0; i<rules.length; i++) {
    float c = (float) i/(rules.length-1);
    colors[i] = floor(60 * (pow(c, 1)));
  }
  
  println(str(colors));
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
  byte[][] next = make2DArray(cols, rows);
  // count without borders
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      int n = countNeibs(i, j);
      //println(grid[i][j]);
      next[i][j] = rules[grid[i][j]][n];
    }
  }
  
  // count  throught borders
  for (int i=0; i < cols; i++) {
    int n = countNeibsBorder(i, 0);
    next[i][0] = rules[grid[i][0]][n];
    n = countNeibsBorder(i, rows-1);
    next[i][rows-1] = rules[grid[i][rows-1]][n];
  }
  
  for (int j=1; j < rows-1; j++) {
    int n = countNeibsBorder(0, j);
    next[0][j] = rules[grid[0][j]][n];
    n = countNeibsBorder(cols-1, j);
    next[cols-1][j] = rules[grid[cols-1][j]][n];
  }

  grid = next;
}

// -----------------------------------------------------------------------
byte[][] loadRules() {
  String[] strRule = loadStrings("rule.txt");
  numberToChoose = int(strRule[0]);
  strRule = split(strRule[numberToChoose], "/");
  int states = int(strRule[strRule.length-1]);
  byte[][] rule = new byte[states][9];
  
  for (int i=0; i<states; i++) {
    for (int j=0; j<9; j++) {
      rule[i][j] = (byte) constrain(i-1, 0, 100000);
    }
    
    for (String s: splitTokens(strRule[i], " ,")) {
      rule[i][int(s)] = (byte) (states-1);
    }
  }
  
  return rule;
}


// -------------------------------------------------------------------------
int countNeibsBorder(int x, int y) {
  int sum = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      sum += (grid[(x + i + cols) % cols][(y + j + rows) % rows] > lifeLimit)? 1 : 0;
    }
  }
  sum -= (grid[x][y] > lifeLimit)? 1 : 0;

  return sum;
}

int countNeibs(int x, int y) {
  int sum = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      sum += (grid[x + i][y + j] > lifeLimit)? 1 : 0;
    }
  }
  sum -= (grid[x][y] > lifeLimit)? 1 : 0;
  return sum;
}

// ----------------------------------------------------------------------------

byte[][] make2DArray(int c, int r) {
  byte[][] n = new byte[c][r];
  return n;
}
