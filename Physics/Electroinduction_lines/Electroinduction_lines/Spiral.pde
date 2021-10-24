class Spiral implements Wire {
  private PVector start, end, a, b;
  private float r, turns;
  
  
  Spiral(PVector start, PVector end, float r, float turns) {
    this.start = start;
    this.end = end;
    this.r = r;
    this.turns = turns;
    
    PVector v = end.sub(start).normalize();
    if(v.dot(1,0,0) != 1) {
      this.a = v.cross(new PVector(1, 0, 0)).normalize();
    } else {
      this.a = v.cross(new PVector(0, 1, 0)).normalize();
    }
    this.b = v.cross(a);
  }
  
  void draw_shape() {
    double t = 0.0;
    double step = 0.001;
    PVector p = null;
    noFill();
    beginShape();
    while(t <= 1) {
      p = get_point((float) t);
      //println(p, t);
      vertex(p.x, p.y, p.z);
      t += step;
      t += step;
    }
    endShape();
  }
  
  PVector get_point(float t) {
    return PVector.add(PVector.lerp(start, end, t),
                       PVector.add(PVector.mult(a, cos(turns * t * TWO_PI) * r),
                                   PVector.mult(b, sin(turns * t * TWO_PI) * r)));
  }
}
