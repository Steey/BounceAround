PShape sh;
Game game;

// Variables tracking the number of keys pressed at the same time on each axis separately
int numKeysPressedX = 0;
int numKeysPressedY = 0;

void setup() {
  size(800,600,P2D); 
  
  
  game = new Game(); //<>//
  game.initialize(); // Method not ready yet
}


void draw() {
  background(128);
  
  game.update();   //<>//
  game.boundingBox(); // Should be called in game.update()?
  game.display(); //<>//
  
}



// The following code in functions: keyPressed() and keyReleased() handles the issue of movement keys
// which are still pressed to not account for adding acceleration to the ball when another movement
// key is released. Before the ball would just move constantly in one direction until a movement key
// was pressed again.

void keyPressed() {
  // Adds acceleration to the ball in the direction accordingly to the pressed movement key
  // and increments the respective counter of pressed keys
  
  if (keyCode == RIGHT || key == 'd') {
    game.ball.MOVE_RIGHT = true;
    game.ball.MOVE_LEFT = false;
    ++numKeysPressedX;
  } else if (keyCode == LEFT || key == 'a') {
    game.ball.MOVE_LEFT = true;
    game.ball.MOVE_RIGHT = false;
    ++numKeysPressedX;
  }
  
  if (key == ' ') {
    game.ball.jump();
  }
}



void keyReleased() {
  // When a movement key is released, decrements the counter of pressed keys
  // and if all the keys on the axis are released, sets the ball's acceleration to 0
  // X axis
  
  // If a movement key is released but other movement keys are still pressed on that
  // axis (direction), a set amount of acceleration is substracted from ball's acceleration
  // on that axis.
  if (keyCode == RIGHT || key == 'd') {
    game.ball.MOVE_RIGHT = false;
    
    if (--numKeysPressedX > 0) {
      game.ball.MOVE_LEFT = true;
    }
  } else if (keyCode == LEFT || key == 'a') {
    game.ball.MOVE_LEFT = false;
    
    if (--numKeysPressedX > 0) {
      game.ball.MOVE_RIGHT = true;
    }
  } 
}
