class Laser {
  constructor(pos, h) {
    this.pos = pos;
    this.vel = p5.Vector.fromAngle(h).mult(10);
  }

  update = () => {
    this.pos.add(this.vel);
  };

  in_borders = () => {
    if (this.pos.x > width) {
      return false;
    } else if (this.pos.x < 0) {
      return false;
    }

    if (this.pos.y > height) {
      return false;
    } else if (this.pos.y < 0) {
      return false;
    }
    return true;
  };

  render = () => {
    push();
    stroke(255);
    strokeWeight(4);
    point(this.pos.x, this.pos.y);
    pop();
  };
}
