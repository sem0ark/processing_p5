class Line implements Shape {
  PVector start;
  PVector end;
  
  Line(PVector start, PVector end) {
    this.start = start;
    this.end = end;
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
    return PVector.lerp(start, end, t);
  }
}
