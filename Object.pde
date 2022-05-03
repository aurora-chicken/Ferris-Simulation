// object with position and movement variables and render, moving, and fallTime (calculating time it takes to fall to level of water in cart (8 ft above ground) 

class Object {
  Vector pos, velocity, acceleration;
  
  Object(Vector pos, Vector velocity, Vector acceleration) {
    this.pos = pos;
    this.velocity = velocity;
    this.acceleration = acceleration;
  }
  
  void render() {
    ellipse(this.pos.x * SCALE, height - this.pos.y * SCALE, RENDER_RADIUS * SCALE, RENDER_RADIUS * SCALE);
  }
  
  void move(Vector m) {
    this.pos.add(m);
  }
  
  float fallTime() {
    Quad quad = new Quad(-16, this.velocity.y, this.pos.y + 8);
    return(quad.root().y);
  }
}
