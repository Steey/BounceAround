class Game {
  float timestep; // Physics' time interval (maybe variable between frames???)
  float gravity; // Value of the gravitational force applied to all objects
  float boxElasticity; // "Springiness" of the box (% of how much speed is retained upon collision)
  ArrayList<GameObject> objects; // List of objects in the game
  Ball ball; // The ball the user controls

  
  Game() {
    timestep = 0.3;
    gravity = 9.8; //// Let's try to use real-world values maybe?
    boxElasticity = 0.5;
    objects = new ArrayList<GameObject>();
    ball = new Ball();
    //ball = new Ball(50);
  }
  
  
  void initialize() {
    // Creates circles with random location 
    for (int i = 0; i < 1; i++) {
      float size = random(100, 200);
      float posx = random(width);
      float posy = random(height);
      
      objects.add(new GameObject(createShape(ELLIPSE, 0, 0, size, size), posx, posy));
    }
  }
  
  void update() {
    // Updates the states of all objects within the game
    
    applyGravity();
    
    for (GameObject obj : objects) {
      obj.update(timestep);
    }
    ball.update(timestep);
    
    collisionDetection();
  }
  
  void applyGravity() {
    // Adds a gravitational force vector to all game objects
   
    for (GameObject obj : objects) {
      obj.acceleration.add(0, gravity*timestep);
    }
    
    ball.acceleration.add(0, gravity*timestep);
  }
  
  void collisionDetection() {
    // Checks for collisions between the ball and other objects and
    // inverts the velocity vector of the ball upon collision
    
    for (int i = 0; i < objects.size(); i++) {
      if (ball.collides(objects.get(i))) {
        ball.velocity.x *= -1;
        ball.velocity.y *= -1;
        println("Collision detected!");
      }
    }
  }
  
  void boundingBox() {
    // Checks if the ball collides with any of the bounding walls and
    // inverts and reduces the velocity on the respective axis if a 
    // collision is detected
    
    if (ball.position.x < ball.radius) {
      ball.position.x = ball.radius;
      ball.velocity.x *= -boxElasticity;
    } else if (ball.position.x > width-ball.radius) {
      ball.position.x = width-ball.radius;
      ball.velocity.x *= -boxElasticity;
    }
    
    if (ball.position.y < ball.radius) {
      ball.position.y = ball.radius;
      ball.velocity.y *= -boxElasticity;
    } else if (ball.position.y > height-ball.radius) {
      ball.position.y = height-ball.radius;
      ball.velocity.y *= -boxElasticity;
    } 
  }
  
  void display() {
    // Displays all game objects on the screen
    
    ball.show();

    for (GameObject obj : objects) {
       obj.show(); 
    }
  }
  
  
  
  
}
