function Bird() {
  this.y = height / 2;
  this.x = 25;

  this.grav = 0.6;
  this.lift = -8;
  this.vel = 0;

  this.show = function () {
    fill(200, 255, 200);
    ellipse(this.x, this.y, 16, 16);
  };

  this.update = function () {
    this.vel += this.grav;
    this.y += this.vel;

    if (this.y > height) {
      this.y = height;
      this.vel = 0;
    }

    if (this.y < 0) {
      this.y = 0;
      this.vel = 0;
    }
  };

  this.jump = function () {
    this.vel = this.lift;
  };
}
