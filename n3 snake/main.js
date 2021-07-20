let s;
const scl = 20;

function setup() {
  createCanvas(600, 600);
  s = new Snake();
  frameRate(10);
  food = pickLocation();
}

function pickLocation() {
  let cols = floor(width / scl);
  let rows = floor(height / scl);
  let food = createVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
  return food;
}

function draw() {
  background(51);
  s.dead();
  s.update();
  s.show();
  if (s.eat(food)) {
    food = pickLocation();
  }

  fill(255, 0, 100);
  rect(food.x, food.y, scl, scl);
}
