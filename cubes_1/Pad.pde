class Pad {
  PVector pos, vel, size;
  int score;
  boolean released, pressed;
  
  
  Pad(float x, float y) {
    score = 0;
    pos = new PVector(x, y);
    vel = new PVector(6, 0);
    size = new PVector(40, 10);
  }
  
  void move() {
    if (keys[2] ^ keys[3]){
      if (keys[2]) {
        if (pos.x-vel.x > -3){
          pos.sub(vel);
        }
      } else if (keys[3]) {
        if (pos.x+vel.x+size.x < width){
          pos.add(vel);
        }
      }
    }
  }
  
  void show() {
    fill(200);
    rect(pos.x, pos.y, size.x, size.y);
  }
}
