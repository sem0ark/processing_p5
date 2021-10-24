import peasy.PeasyCam;

ArrayList<Wire> wires = new ArrayList<Wire>();
final float ScaleCoef = 50;

PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 50);
  //frameRate(400);
  //wires.add(new Line(new PVector(0, 0, 0), new PVector(0, 0, 1)));
  //wires.add(new Line(new PVector(0, 0, 0), new PVector(0, 1, 0)));
  //wires.add(new Line(new PVector(0, 0, 0), new PVector(1, 0, 0)));
  //wires.add(new Circle(new PVector(0, 0, 0), new PVector(1, 1, 1), 1));
  wires.add(new Spiral(new PVector(0, 0, 0), new PVector(1, 1, 1), 0.1, 30));
}

void draw() {
  background(0);
  stroke(255);
  translate(0, 0, -80);
  scale(ScaleCoef);
  strokeWeight(1/ScaleCoef);
  for (Wire w: wires) {
    w.draw_shape();
  }
}
