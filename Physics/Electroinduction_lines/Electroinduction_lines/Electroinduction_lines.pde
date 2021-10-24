import peasy.PeasyCam;

ArrayList<Wire> wires = new ArrayList<Wire>();
ArrayList<InductionTracer> tracers = new ArrayList<InductionTracer>();
final float ScaleCoef = 50;

PeasyCam cam;

final int xnTracers = 2;
final int ynTracers = 2;
final int znTracers = 8;

final float limit = 1.01;
final int steps = 32;
final int MaxTraceSize = 20000;
final float stepTracer = 0.01;

final float stepWire = 0.001;



void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 360, 1.0, 1.0);
  cam = new PeasyCam(this, 0, 0, 0, 100);
  cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
  //frameRate(400);
  //wires.add(new Wire(new Line(new PVector(0, 0, -0.1), new PVector(0, 0, 0.1)), 1));
  //wires.add(new Wire(new Line(new PVector(0, -1, 0), new PVector(0, 1, 0)), 1));
  //wires.add(new Wire(new Line(new PVector(0, 0, -1), new PVector(0, 0, 1)), 0.01));
  //wires.add(new Wire(new Circle(new PVector(0, 0, 0), new PVector(1, 0, 0), 1), 1));
  //wires.add(new Wire(new Circle(new PVector(0, 0, 0), new PVector(0, 1, 0), 1), 1));
  wires.add(new Wire(new Circle(new PVector(0, 0, 0), new PVector(0, 0, 1), 0.1), 0.01));
  wires.add(new Wire(new Circle(new PVector(0, 0, 0.1), new PVector(0, 0, 1), 0.1), 0.01));
  wires.add(new Wire(new Circle(new PVector(0, 0, 0.2), new PVector(0, 0, 1), 0.1), 0.01));
  wires.add(new Wire(new Circle(new PVector(0, 0, -0.1), new PVector(0, 0, 1), 0.1), 0.01));
  wires.add(new Wire(new Circle(new PVector(0, 0, -0.2), new PVector(0, 0, 1), 0.1), 0.01));
  //wires.add(new Wire(new Spiral(new PVector(0, 0, -0.1), new PVector(0, 0, 0.1), 0.1, 30), 1));
  createTracers();
  initTracers();
  println(tracers.size());
}

void createTracers() {
  float start = -0.5;
  float end   =  0.5;
  for(int x=0; x<=xnTracers; x++) {
    for(int y=0; y<=ynTracers; y++) { 
      for(int z=0; z<=znTracers; z++) {
        tracers.add(new InductionTracer(new PVector(
          map(x, 0, xnTracers, start, end),
          map(y, 0, ynTracers, start, end),
          map(z, 0, znTracers, start, end)
        )));
      }
    }
  }
}

void initTracers() {
  for (InductionTracer t: tracers) {
    t.trace();
  }
}

void draw() {
  background(0);
  //translate(0, 0, -80);
  scale(ScaleCoef);
  
  for (Wire w: wires) {
    w.draw_shape();
  }
  
  for (InductionTracer t: tracers) {
    t.drawTrace();
  }
}
