class Ship {
  constructor() {
    this.pos = createVector(width / 2, height / 2);
    this.r = 15;
    this.heading = 0;
    this.rotation = 0;
    this.vel = createVector(0, 0);
    this.accel = 0;
  }

  update = () => {
    this.turn();
    this.boost();
    this.pos.add(this.vel);
    this.vel.mult(0.96);
    this.wrap();
  };

  boost = () => {
    let force = p5.Vector.fromAngle(this.heading).mult(this.accel);
    this.vel.add(force);
  };

  render = () => {
    push();
    translate(this.pos.x, this.pos.y);
    rotate(this.heading + PI / 2);
    fill(0);
    stroke(255);
    triangle(-this.r, this.r, this.r, this.r, 0, -this.r);
    pop();
  };

  turn = () => {
    this.heading += this.rotation;
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

  setRotation = (a) => {
    this.rotation = a;
  };

  setAcceleration = (a) => {
    this.accel = a;
  };
}
