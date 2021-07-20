int ipow(int a, int b) {
  int res = 1;
  
  if (b==1) {return res;};
  
  for (int i=0; i<b; i++) {
    res = res * a;
  }
  return res;
}

int getCurState(int x, int y) {
  int s = 0;
  int t = states;
  
  s += grid[x][y-1] * ipow(t, neib_coefs[0]);
  s += grid[x+1][y] * ipow(t, neib_coefs[1]);
  s += grid[x][y+1] * ipow(t, neib_coefs[2]);
  s += grid[x-1][y] * ipow(t, neib_coefs[3]);
  s += grid[x][y]   * ipow(t, neib_coefs[4]);

  return s;
}

int getCurStateBorder(int x, int y) {
  int s = 0;
  int t = states;
  s += grid[(x + cols) % cols][(y-1 + rows) % rows] * ipow(t, neib_coefs[0]);
  s += grid[(x+1 + cols) % cols][(y + rows) % rows] * ipow(t, neib_coefs[1]);
  s += grid[(x + cols) % cols][(y+1 + rows) % rows] * ipow(t, neib_coefs[2]);
  s += grid[(x-1 + cols) % cols][(y + rows) % rows] * ipow(t, neib_coefs[3]);
  s += grid[(x + cols) % cols][(y + rows) % rows]   * ipow(t, neib_coefs[4]);
  
  return s;
}
