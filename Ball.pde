class Ball extends GameObject {
  float radius;
  
  Ball() {
    super(createShape(ELLIPSE, 0, 0, 100, 100), new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0));
    this.radius = 50;
  }
  
  Ball(float radius) {
    super(createShape(ELLIPSE, 0, 0, 2*radius, 2*radius), new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0));
    this.radius = radius;
  }
  
    
  void show() {
    this.shape.setFill(color(255, 0, 0));
    super.show();
    println("Radius: " + this.radius);
  }
    
    
  void jump() {
    this.acceleration.add(0, -3);
  }
  
  void setAcceleration(float x, float y) {
    this.acceleration.x = x;
    this.acceleration.y = y;
  }
  
}
