// class to calculate roots of quadratics

class Quad {
  float a, b, c;
  
  Quad(float a, float b, float c) {
    this.a = a;
    this.b = b;
    this.c = c;
  }
  
  Vector root() {
    float u = (float) Math.sqrt(b*b-4*a*c);
    return(new Vector((-b+u)/(2*a), (-b-u)/(2*a)));
  }
}
