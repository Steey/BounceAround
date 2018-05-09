class Game {
  float timestep; //time interval (maybe variable between frames???)
  float gravity;
  ArrayList<GameObject> objects;
  Ball ball;
  
  Game() {
    timestep = 0.3;
    gravity = 9.8; //Let's try to use real-world values maybe?
    objects = new ArrayList<GameObject>();
    ball = new Ball();
  }
  
  
  void initialize() {
    //add objects
    for (int i = 0; i < 1; i++) {
      float size = random(100, 200);
      float posx = random(width);
      float posy = random(height);
      
      objects.add(new GameObject(createShape(ELLIPSE, 0, 0, size, size), posx, posy));
    }
  }
  
  void update() {
    //update all objects within the game
    for (GameObject obj : objects) {
      obj.update(timestep);
    }
    ball.update(timestep);
    
    collisionDetection();
  }
  
  void collisionDetection() {
    for (int i = 0; i < objects.size(); i++) {
      if (ball.collides(objects.get(i))) {
        ball.velocity.x *= -1;
        ball.velocity.y *= -1;
        println("Collision detected!");
      }
    }
  }
  
  void boundingBox() {
    if (game.ball.position.x < 50) {
      game.ball.position.x = 50;
      game.ball.velocity.x *= 0;
    } else if (game.ball.position.x > width-50) {
      game.ball.position.x = width-50;
      game.ball.velocity.x *= 0;
    }
    
    if (game.ball.position.y < 50) {
      game.ball.position.y = 50;
      game.ball.velocity.y *= 0;
    } else if (game.ball.position.y > height-50) {
      game.ball.position.y = height-50;
      game.ball.velocity.y *= 0;
    } 
  }
  
  void display() {
    ball.show();
    int count = 0;
    for (GameObject obj : objects) {
       obj.show(); 
       //println(++count);
    }
  }
  
  
  
  
}
