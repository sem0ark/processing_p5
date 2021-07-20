class Pipe {
  constructor() {
    this.hole = random(70, 100);
    this.top = random(30, height - this.hole - 30);
    this.bottom = this.top + this.hole;
    this.w = 40;
    this.x = width;
    this.speed = 5;
    this.highlight = false;
  }

  show = function () {
    fill(255);
    if (this.highlight) {
      fill(255, 0, 0);
    }
    rect(this.x, 0, this.w, this.top);
    rect(this.x, this.bottom, this.w, height - this.bottom);
  };

  update = function () {
    this.x -= this.speed;
  };

  collides = function (bird) {
    if (this.x <= bird.x && bird.x <= this.x + this.w) {
      if (!(this.top <= bird.y && bird.y <= this.bottom)) {
        this.highlight = true;
        return true;
      }
    }
    this.highlight = false;
  };
}
