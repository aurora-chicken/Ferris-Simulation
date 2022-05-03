// desmos is more accurate than this program due to this program using floats instead of the doubles that desmos uses causing its cummulative rounding errors to be more impactful than desmos'
// the acceleration value in objects isn't used, but im keeping it as boiler plate

// constants
final float SCALE = 250.0/240.0;
final float GRAVITY = 32;
final float TIME_OF_RELEASE = 11.244; //11.344; sam's answer
final float RENDER_RADIUS = 8.0;
final float FERRIS_RADIUS = 50.0;
final float FERRIS_TURN_RATE = 1.0/40.0 * 2 * PI;
final Vector FERRIS_CENTER = new Vector(240.0, 65.0);
final Vector CART_START_POS = new Vector(0.0, 0.0);
final Vector CART_START_VEL = new Vector(15.0, 0.0);
final Vector CART_START_ACCEL = new Vector(0.0, 0.0);
final Vector PERSON_START_POS = new Vector(FERRIS_CENTER.x + FERRIS_RADIUS, 65.0);
final Vector PERSON_START_VEL = new Vector(0.0, 0.0);
final Vector PERSON_START_ACCEL = new Vector(0.0, 0.0);

// variables
int phase = 0;
Object cart = new Object(CART_START_POS, CART_START_VEL, CART_START_ACCEL);
Object person = new Object(PERSON_START_POS, PERSON_START_VEL, PERSON_START_ACCEL);

// setting size and outputting starting positions
void setup() {
  size(500, 500);
  System.out.println("cart: " + cart.pos.x + " " + cart.pos.y + " person: " + person.pos.x + " " + person.pos.y);
}

// render everything
void draw() {
  background(255);
  ellipse(FERRIS_CENTER.x * SCALE, height - FERRIS_CENTER.y * SCALE, FERRIS_RADIUS * SCALE * 2, FERRIS_RADIUS * SCALE * 2);
  fill(255, 0, 0);
  cart.render();
  fill(200);
  person.render();
}

// progress phase (0 is start, 1 is at drop, & 2 is when the person falls to the height of the water) & change positions
void keyReleased() {
  phase++;
  if (phase == 1) {
    cart.move(new Vector(TIME_OF_RELEASE * cart.velocity.x, TIME_OF_RELEASE * cart.velocity.y));
    person.pos.set(cos(TIME_OF_RELEASE * FERRIS_TURN_RATE) * 50 + FERRIS_CENTER.x, sin(TIME_OF_RELEASE * FERRIS_TURN_RATE) * 50 + FERRIS_CENTER.y);
    person.velocity.set(50 * -sin(TIME_OF_RELEASE * FERRIS_TURN_RATE) * FERRIS_TURN_RATE, 50 * cos(TIME_OF_RELEASE * FERRIS_TURN_RATE) * FERRIS_TURN_RATE);
    System.out.println("cart: " + cart.pos.x + " " + cart.pos.y + " person: " + person.pos.x + " " + person.pos.y);
  } else if (phase == 2) {
    float fallTime = person.fallTime();
    cart.move(new Vector(fallTime * cart.velocity.x, fallTime * cart.velocity.y));
    person.move(new Vector(fallTime * person.velocity.x, 0));
    person.pos.set(person.pos.x, 8);
    System.out.println("cart: " + cart.pos.x + " " + cart.pos.y + " person: " + person.pos.x + " " + person.pos.y);
  }
}
