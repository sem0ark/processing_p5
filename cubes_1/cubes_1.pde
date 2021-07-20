Cubes cubes;
Pad pad;

boolean[] keys = {
  false, false, false, false
};

void keyPressed() {
  updateKeys(keyCode, true);
}
 
void keyReleased() {
  updateKeys(keyCode, false);
}

void updateKeys(int c, boolean b) { // deside, what keys are pressed
  if (c == UP) keys[0] = b;
  if (c == DOWN) keys[1] = b;
  if (c == LEFT) keys[2] = b;
  if (c == RIGHT) keys[3] = b;
}

boolean rectIntersect(PVector rPos1, // deside, if 2 rectangles intersect
                      PVector rSize1,
                      PVector rPos2,
                      PVector rSize2)
{
  PVector l1, l2;
  l1 = rPos1;
  l2 = rPos2;
  
  if (l1.x >= l2.x+rSize2.x || l2.x >= l1.x+rSize1.x) {
      return false;
  } 
  if (l1.y >= l2.y+rSize2.y || l2.y >= l1.y+rSize1.y) {
      return false;
  }
  return true;
}

void setup() {
  size(400,600);
  cubes = new Cubes(7);
  pad = new Pad((width-40)/2, height-40);
  textSize(18);
}

void draw() {
  background(90);
  cubes.update();
  cubes.show();
  
  pad.move();
  pad.show();
  
  fill(255);
  text(pad.score, 20, 20);
}
