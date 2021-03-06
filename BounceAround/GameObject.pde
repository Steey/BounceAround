class GameObject {
  PShape shape; // Holds the geometrical structure of the object
  PVector position; // Location of the object
  PVector velocity; // Speed of the object
  PVector acceleration; // Acceleration of the object
  PVector netForce; // Sum of all forces exerted on the object resulting in a net force
  float mass; // Mass of the object
  
  
  GameObject(PShape shape, float x, float y, float mass) {
    // Constructor taking in a PShape object and its position
    this.shape = shape;
    this.position = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.netForce = new PVector(0, 0);
    this.mass = mass;
  }
  //GameObject(PShape sh, PVector p, PVector v, PVector a) {
  //  // Constructor taking in a PShape object and all of its physical attributes
  //  shape = sh;
  //  position = p;
  //  velocity = v;
  //  acceleration = a;
  //}

  void update(float dt) {
    // Updates the state of the object (position, velocity, acceleration, netForce)
        
    acceleration.add(PVector.mult(PVector.div(netForce, mass), dt));
    velocity.add(PVector.mult(acceleration, dt));
    
    //if (abs(position.x - PVector.add(position, PVector.mult(velocity, dt)).x) > 1) {
    //  position.add(PVector.mult(velocity, dt));
    //}
    
    position.add(PVector.mult(velocity, dt));
    acceleration.mult(0);
    netForce.mult(0);  
  }
  
  void show() {
    // Draws the object on the screen
    
    pushMatrix();
    translate(position.x, position.y);
    shape(shape);
    popMatrix(); 
  }
  
  boolean collides(GameObject obj) {
    // Detects collision with another game object
    
    if (this.position.dist(obj.position) <= this.shape.getWidth()/2 + obj.shape.getWidth()/2) {
      return true;
    } else {
      return false;
    }
  }
  
  void applyForce(PVector force) {
    this.netForce.add(force);
  }
  void applyForce(float fx, float fy) {
    this.netForce.x += fx;
    this.netForce.y += fy;
  }

  
}
