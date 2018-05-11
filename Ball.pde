class Ball extends GameObject {
  float radius;
  
  Ball() {
    // Creates a PShape object in a GameObject constructor with a default radius
    super(createShape(ELLIPSE, 0, 0, 100, 100), new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0));
    this.radius = 50;
  }
  
  Ball(float radius) {
    // Creates a PShape object in a GameObject constructor with a set radius
    super(createShape(ELLIPSE, 0, 0, 2*radius, 2*radius), new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0));
    this.radius = radius;
  }
  
    
  void show() {
    // Sets a color specific to the ball
    this.shape.setFill(color(255, 0, 0));
    // Calls a GameObject.show() method to handle the displaying
    super.show();
  }
    
    
  void jump() {
    // Adds acceleration when the function is called upon pressing Spacebar
    this.acceleration.add(0, -100);
  }
  
}
