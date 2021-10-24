class Circle implements Shape {
  private PVector a, b, c;
  private float r;
  
  Circle(PVector start, PVector end, float r) {
    PVector v = end.sub(start).normalize();
    if(v.dot(1,0,0) == 1) {
      this.a = v.cross(new PVector(1, 0, 0)).normalize();
    } else {
      this.a = v.cross(new PVector(0, 1, 0)).normalize();
    }
    this.b = v.cross(a);
    this.c = start;
    this.r = r;
    println(a, b, c);
  }
  
  void draw_shape() {
    float t = 0;
    float step = 0.01;
    PVector p = null;
    
    strokeWeight(1.5/ScaleCoef);
    noFill();
    beginShape();
    while (t < 1) {
      stroke(map(t, 0,1,240,360), 1, 1);
      p = get_point(t);
      //println(p, t);
      vertex(p.x, p.y, p.z);
      t += step;
    }
    endShape();
  }
  
  PVector get_point(float t) {
    return PVector.add(c, PVector.add(PVector.mult(a, cos(t * TWO_PI) * r),PVector.mult(b, sin(t * TWO_PI) * r)));
  }
}
