class Ball extends GameObject {
  
  Ball() {
    super(createShape(ELLIPSE, 0, 0, 100, 100), new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0));
  }
  
    
  void show() {
    super.shape.setFill(color(255, 0, 0));
    super.show();
  }
    
    
  void jump() {
    
  }
  
  void setAcceleration(float x, float y) {
    this.acceleration.x = x;
    this.acceleration.y = y;
  }
  
}
