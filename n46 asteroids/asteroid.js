class Asteroid {
  constructor(
    pos = createVector(random(width), random(height)),
    r = random(40, 50)
  ) {
    this.pos = pos;
    this.r = r;
    this.vel = p5.Vector.random2D().mult(1.5);
    this.offset = [];
    this.total = floor(random(5, this.r / 4)) + 5;
    for (let i = 0; i < this.total; i++) {
      this.offset[i] = random(this.r * -0.25, this.r * 0.25);
    }
  }

  update = () => {
    this.pos.add(this.vel);
    this.wrap();
  };

  breakup = () => {
    let newA = [];
    if (this.r > 10) {
      let n = floor(random(1, 4));
      for (let i = 0; i < n; i++) {
        newA.push(new Asteroid(this.pos.copy(), this.r / 1.5));
      }
    }
    return newA;
  };

  wrap = () => {
    if (this.pos.x > width + this.r) {
      this.pos.x = -this.r;
    } else if (this.pos.x < -this.r) {
      this.pos.x = width + this.r;
    }

    if (this.pos.y > height + this.r) {
      this.pos.y = -this.r;
    } else if (this.pos.y < -this.r) {
      this.pos.y = height + this.r;
    }
  };

  render = () => {
    push();
    stroke(0);
    fill(255);
    translate(this.pos.x, this.pos.y);
    beginShape();
    for (let i = 0; i < this.total; i++) {
      let angle = map(i, 0, this.total, 0, TWO_PI);
      let r = this.r + this.offset[i];
      let x = r * cos(angle);
      let y = r * sin(angle);
      vertex(x, y);
    }
    endShape(CLOSE);
    pop();
  };
}
