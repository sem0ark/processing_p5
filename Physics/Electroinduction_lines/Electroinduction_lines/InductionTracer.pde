class InductionTracer {
  private PVector pos;
  private PVector start;
  public ArrayList<PVector> points;
  
  
  InductionTracer(PVector start) {
    this.pos = start;
    this.start = start;
  }
  
  void trace() {
    points = new ArrayList<PVector>();
    int i = 0;
    while (i<MaxTraceSize && abs(pos.x)<=limit && abs(pos.y)<=limit && abs(pos.z)<=limit) {
      doSteps(pos, steps);
      points.add(this.pos.copy());
      i += steps;
    }
    
    println(points.size());
  }
  
  private void doSteps(PVector p, int steps) {
    for (int i=0; i<steps; i++) {
      p.add(getB().mult(stepTracer));
      if (abs(pos.x)>1.1 || abs(pos.y)>1.1 || abs(pos.z)>1.1) return ;
      if (start.dist(pos) < stepTracer*0.1) return ;
    }
  }
  
  void drawTrace() {
    stroke(120, 1, 1);
    noFill();
    strokeWeight(1/ScaleCoef);
    beginShape();
    for (PVector p: points) {
      vertex(p.x, p.y, p.z);
    }
    endShape();
  }
  
  private PVector getB() {
    PVector B = new PVector(0,0,0);
    for (Wire w: wires) {
      B.add(w.getB(pos));
    }
    //println(B);
    return B.normalize();
    //return new PVector(1, 0, 0);
  }
}
