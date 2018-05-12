class Ball extends GameObject {
  float radius;
  boolean MOVE_RIGHT;
  boolean MOVE_LEFT;
  boolean JUMP_FLAG;

  
  Ball() {
    // Creates a PShape object in a GameObject constructor with a default radius
    super(createShape(ELLIPSE, 0, 0, 100, 100), width/2, height/2, 1);
    this.radius = 50;
    this.MOVE_RIGHT = false;
    this.MOVE_LEFT = false;
    this.JUMP_FLAG = false;
  }
  
  Ball(float radius) {
    // Creates a PShape object in a GameObject constructor with a set radius
    super(createShape(ELLIPSE, 0, 0, 2*radius, 2*radius), width/2, height/2, 1);
    this.radius = radius;
    this.MOVE_RIGHT = false;
    this.MOVE_LEFT = false;
    this.JUMP_FLAG = false;
  }
  
  Ball(float radius, float x, float y, float mass) {
    super(createShape(ELLIPSE, 0, 0, 2*radius, 2*radius), x, y, mass);
    this.radius = radius;
    this.mass = mass;
    this.MOVE_RIGHT = false;
    this.MOVE_LEFT = false;
    this.JUMP_FLAG = false;
  }
  
    
  void show() {
    // Sets a color specific to the ball
    this.shape.setFill(color(255, 0, 0, 128));
    // Calls a GameObject.show() method to handle the displaying
    super.show();
  }
    
    
  void jump() {
    // Adds vertical velocity when the function is called upon pressing Spacebar
    this.velocity.add(0, -35);
  }
  
  
  
}
