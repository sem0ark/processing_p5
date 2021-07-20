let bird;
let pipes = [];

function setup() {
  createCanvas(500, 400);
  bird = new Bird();
  pipes.push(new Pipe());
  console.log(bird);
}

function draw() {
  background(0);
  bird.update();
  bird.show();

  if (frameCount % 80 == 0) {
    pipes.push(new Pipe());
  }

  pipes.forEach((pipe) => {
    pipe.update();
    pipe.show();

    if (pipe.collides(bird)) {
      console.log("HIT");
    }
  });

  for (i = 0; i < pipes.length; i++) {
    if (pipes[i].x < -30) {
      pipes.splice(i, 1);
    }
  }
}

function keyPressed() {
  if (key == " ") {
    bird.jump();
  }
}
