class Wire {
  Shape shape;
  float I;
  
  Wire(Shape shape, float I) {
    this.shape = shape;
    this.I = I;
  }
  
  void draw_shape() {
    shape.draw_shape();
  }
  
  PVector getB(PVector pos) {
    float t = 0;
    PVector p0 = shape.get_point(0);
    PVector p1 = shape.get_point((float) stepWire);
    PVector B = new PVector(0,0,0);
    while (t < 1) {
      PVector B_v = PVector.sub(p1, pos).cross(PVector.sub(p0, pos));
      float r_sq = PVector.sub(p0, pos).magSq();
      float dl = p1.dist(p0);
      float dist_sq = B_v.magSq() / r_sq;
      
      PVector dB = PVector.mult(B_v.normalize(), I * dl * sqrt(1 - dist_sq / r_sq) / (2 * r_sq));
      B.add(dB);
      t += stepWire;
      p0 = p1;
      p1 = shape.get_point(t+stepWire);
    }
    return B;
  }
}
