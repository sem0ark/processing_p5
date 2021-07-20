class Cube {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector size = new PVector(10,10);
  int r, g, b;
  int cubeScore;
  boolean dead = false;
  
  Cube(float x, float y) {
    r = 100 + round(random(125));
    g = 100 + round(random(125));
    b = 100 + round(random(125));
    cubeScore = ceil((r+g+b-300)/10);
    pos = new PVector(x, y);
    vel = new PVector(0, 2 + random(2));
    acc = new PVector(0, (r+g+b-300)/2000);
  }
  
  void move() {
    vel.add(acc);
    pos.add(vel);
    //if (pos.y + size.y >= pad.pos.y) {
    //  vel.limit(2);
    //}
  }
  
  void show() {
    fill(r,g,b);
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  void update() {
    if (!dead ){
      move();
      if (pos.y > height){
        dead = true;
        pad.score -= cubeScore;
      } else if (rectIntersect(pos, size,
                        pad.pos, pad.size))
      {
        dead = true;
        pad.score += cubeScore;
      }
    }
  }
}

class Cubes {
  Cube[] cubes;
  
  Cubes(int size) {
    cubes = new Cube[size];
    
    for (int i=0; i<size; i++) {
      cubes[i] = new Cube(1 + floor(random(width/13))*13, -10);
    }
  }
  
  void update() {
    for (int i=0; i<cubes.length; i++) {
      cubes[i].update();
      if (cubes[i].dead) {
        cubes[i] = new Cube(1 + floor(random(width/13))*13, -10);
      }
    }
  }
  
  void show() {
    for (int i=0; i<cubes.length; i++) {
      cubes[i].show();
    }
  }
}
