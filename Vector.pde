// vector with addition and setting methods

class Vector {
  float x, y;
  
  Vector(float x, float y) {
    this.x =x;
    this.y = y;
  }
  
  void add(Vector v) {
    this.x += v.x;
    this.y += v.y;
  }
  
  void set(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
