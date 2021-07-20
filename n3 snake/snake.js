function keyPressed() {
  switch (keyCode) {
    case UP_ARROW:
      s.dir(0, -1);
      break;
    case DOWN_ARROW:
      s.dir(0, 1);
      break;
    case RIGHT_ARROW:
      s.dir(1, 0);
      break;
    case LEFT_ARROW:
      s.dir(-1, 0);
      break;
    default:
      break;
  }
}

function mousePressed() {
  s.total++;
}

function Snake() {
  this.x = 0;
  this.y = 0;
  this.xspeed = 1;
  this.yspeed = 0;
  this.total = 0;
  this.tail = [];

  this.update = () => {
    if (this.total === this.tail.length) {
      for (let i = 0; i < this.total - 1; i++) {
        this.tail[i] = this.tail[i + 1];
      }
    }
    this.tail[this.total - 1] = createVector(this.x, this.y);

    this.x = this.x + this.xspeed * scl;
    this.y = this.y + this.yspeed * scl;

    this.x += width;
    this.y += height;
    this.x %= width;
    this.y %= height;
  };

  this.show = () => {
    fill(255);
    for (let i = 0; i < this.total; i++) {
      rect(this.tail[i].x, this.tail[i].y, scl, scl);
    }
    rect(this.x, this.y, scl, scl);
  };

  this.dir = (x, y) => {
    this.xspeed = x;
    this.yspeed = y;
  };

  this.eat = (pos) => {
    var d = dist(this.x, this.y, pos.x, pos.y);
    if (d < 1) {
      this.total++;
    }
    return d < 1;
  };

  this.dead = () => {
    for (let i = 0; i < this.tail.length; i++) {
      const pos = this.tail[i];
      if (dist(this.x, this.y, pos.x, pos.y) < 1) {
        this.total = 0;
        this.tail = [];
      }
    }
  };
}
