function make2DArray(cs, rs) {
  let arr = new Array(cs);
  for (let i = 0; i < arr.length; i++) {
    arr[i] = new Array(rs);
  }

  return arr;
}

let grid;
let cols;
let rows;
let res = 5;

const states = 2;
const rules = new Array(states);
const rs = [
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 0, 0, 0, 0, 0],
];

function setup() {
  createCanvas(windowWidth, windowHeight);

  cols = floor(width / res);
  rows = floor(height / res);

  grid = make2DArray(cols, rows);

  for (let i = 0; i < cols; i++) {
    for (let j = 0; j < rows; j++) {
      grid[i][j] = floor(random(2));
    }
  }

  for (let i = 0; i < rules.length; i++) {
    rules[i] = new Array(9);
    for (let j = 0; j < 9; j++) {
      rules[i][j] = rs[i][j];
    }
  }
}

function draw() {
  background(0);

  for (let i = 0; i < cols; i++) {
    for (let j = 0; j < rows; j++) {
      if (grid[i][j] > 0) {
        stroke(255);
        fill(255);
        rect(i * res, j * res, res, res);
      }
    }
  }

  let next = make2DArray(cols, rows);

  for (let i = 0; i < cols; i++) {
    for (let j = 0; j < rows; j++) {
      let n = countNeibs(grid, i, j);
      next[i][j] = rules[grid[i][j]][n];
    }
  }

  grid = next;

  // console.log("draw");
}

function countNeibs(grid, x, y) {
  let sum = 0;
  for (let i = -1; i < 2; i++) {
    for (let j = -1; j < 2; j++) {
      sum += grid[(x + i + cols) % cols][(y + j + rows) % rows];
    }
  }
  sum -= grid[x][y];

  return sum;
}
