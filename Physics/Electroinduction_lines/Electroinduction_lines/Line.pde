class Line implements Wire {
  PVector start;
  PVector end;
  
  Line(PVector start, PVector end) {
    this.start = start;
    this.end = end;
  }
  
  void draw_shape() {
    stroke(255);
    line(start.x, start.y, start.z, end.x, end.y, end.z);
  }
  
  PVector get_point(float t) {
    return PVector.lerp(start, end, t);
  }
}
