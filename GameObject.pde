class GameObject {
  PShape shape;
  PVector position;
  PVector velocity;
  PVector acceleration;
  ArrayList<PVector> forces; // ??????????
  float mass;
  
  
  GameObject(PShape sh, float x, float y) {
    shape = sh;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    forces = new ArrayList<PVector>(0);
  }
  GameObject(PShape sh, PVector p, PVector v, PVector a) {
    shape = sh;
    position = p;
    velocity = v;
    acceleration = a;
  }

  void update(float dt) {
    position.x = position.x + velocity.x * dt;
    position.y = position.y + velocity.y * dt;
    velocity.x = velocity.x + acceleration.x * dt;
    velocity.y = velocity.y + acceleration.y * dt;
    //accel.x = accel.x + (forces.x / mass) * dt; // ???
    
    
  }
  
  void show() {
    pushMatrix();
    translate(position.x, position.y);
    shape(shape);
    popMatrix(); 
    //println(this.position.x, this.position.y);
  }
  
  boolean collides(GameObject obj) {
    //println(this.position.dist(obj.position));
    if (this.position.dist(obj.position) <= this.shape.getWidth()/2 + obj.shape.getWidth()/2) {
      return true;
    } else {
      return false;
    }
  }
  
}
