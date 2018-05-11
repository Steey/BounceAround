class GameObject {
  PShape shape; // Holds the geometrical structure of the object
  PVector position; // Location of the object
  PVector velocity; // Speed of the object
  PVector acceleration; // Acceleration of the object
  PVector netForce; // Sum of all forces exerted on the object resulting in a net force
  float mass; // Mass of the object
  
  
  GameObject(PShape sh, float x, float y) {
    // Constructor taking in a PShape object and its position
    shape = sh;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    netForce = new PVector(0, 0);
  }
  GameObject(PShape sh, PVector p, PVector v, PVector a) {
    // Constructor taking in a PShape object and all of its physical attributes
    shape = sh;
    position = p;
    velocity = v;
    acceleration = a;
  }

  void update(float dt) {
    // Updates the state of the object (position, velocity, acceleration, netForce)
    
    velocity.add(PVector.mult(acceleration, dt));
    position.add(PVector.mult(velocity, dt));
    acceleration.mult(0);
    
    //velocity.x = velocity.x + acceleration.x * dt;
    //velocity.y = velocity.y + acceleration.y * dt;
    //position.x = position.x + velocity.x * dt;
    //position.y = position.y + velocity.y * dt;
    
    ////accel.x = accel.x + (forces.x / mass) * dt; // ???
    
    
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
  
}
