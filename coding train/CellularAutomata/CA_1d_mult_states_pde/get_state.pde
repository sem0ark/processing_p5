int getCurState(int x) {
  int s = 0, c = floor(neibs/2);
  //println();
  for (int i=0; i<c; i++) {
    s += floor(pow(states, neibs-1-i)) * grid[x-c+i];
    s += floor(pow(states, i)) * grid[x+c-i];
  }
  if (neibs % 2 != 0) {
    s += grid[x] * floor(pow(states, c));
  }
  return s;
}

int getCurStateBorder(int x) {
  int s = 0, c = floor(neibs/2);
  
  for (int i=0; i<c; i++) {
    s += floor(pow(states, neibs-1-i)) * grid[(x-c+i + cols) % cols];
    s += floor(pow(states, i)) * grid[(x+c-i + cols) % cols]; 
  }
  if (neibs % 2 != 0) {
    s += grid[x] * floor(pow(states, c));
  }
  return s;
}
