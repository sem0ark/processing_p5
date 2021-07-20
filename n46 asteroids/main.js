let ship;
let asteroids = [];
let lasers = [];
const ASTEROINDS_MIN = 10;

function setup() {
  createCanvas(windowWidth, windowHeight);
  ship = new Ship();

  for (let i = 0; i < ASTEROINDS_MIN; i++) {
    asteroids[i] = new Asteroid();
  }
}

function draw() {
  background(0);
  ship.render();
  ship.update();

  while (asteroids.length < ASTEROINDS_MIN) {
    asteroids.push(new Asteroid());
  }

  asteroids.forEach((el) => {
    el.update();
    el.render();
    if (hits(ship.pos, el.pos, el.r)) {
      fill(155);
      stroke(0);
      textSize(64);
      text("GAME OVER", width / 2 - 140, height / 2 - 40);
      noLoop();
    }
  });

  for (let i = lasers.length - 1; i >= 0; i--) {
    if (!lasers[i].in_borders()) {
      lasers.splice(i, 1);
    }
  }

  for (let i = lasers.length - 1; i >= 0; i--) {
    let el = lasers[i];
    el.update();
    el.render();
    for (let j = asteroids.length - 1; j >= 0; j--) {
      let asteroid = asteroids[j];
      if (hits(el.pos, asteroid.pos, asteroid.r)) {
        let newAsteroids = asteroid.breakup();
        console.log(newAsteroids);
        asteroids.push(...newAsteroids);
        asteroids.splice(j, 1);
        lasers.splice(i, 1);
        break;
      }
    }
  }
}

function keyReleased() {
  switch (keyCode) {
    case LEFT_ARROW:
      ship.setRotation(0);
      break;
    case RIGHT_ARROW:
      ship.setRotation(0);
      break;
    case UP_ARROW:
      ship.setAcceleration(0);
      break;
  }
}

function hits(pa, pb, r) {
  return dist(pa.x, pa.y, pb.x, pb.y) < r;
}

function keyPressed() {
  if (key == " ") {
    lasers.push(new Laser(ship.pos.copy(), ship.heading));
  }
  switch (keyCode) {
    case UP_ARROW:
      ship.setAcceleration(0.2);
      break;
    case LEFT_ARROW:
      ship.setRotation(-0.1);
      break;
    case RIGHT_ARROW:
      ship.setRotation(0.1);
      break;
  }
}
