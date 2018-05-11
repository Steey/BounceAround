PShape sh;
Game game;

// Variables tracking the number of keys pressed at the same time on each axis separately
int numKeysPressedX = 0;
int numKeysPressedY = 0;

void setup() {
  size(800,600,P2D); 
  
  
  game = new Game(); //<>// //<>//
  //game.initialize(); // Method not ready yet
}


void draw() {
  background(128);
  
  game.update();   //<>// //<>//
  game.boundingBox(); // Should be called in game.update()
  game.display(); //<>// //<>//
  
}



// The following code in functions: keyPressed() and keyReleased() handles the issue of movement keys
// which are still pressed to not account for adding acceleration to the ball when another movement
// key is released. Before the ball would just move constantly in one direction until a movement key
// was pressed again.

void keyPressed() {
  // Adds acceleration to the ball in the direction accordingly to the pressed movement key
  // and increments the respective counter of pressed keys
  if (keyCode == RIGHT || key == 'd') {
    game.ball.acceleration.x = 10;
    ++numKeysPressedX;
  } else if (keyCode == LEFT || key == 'a') {
    game.ball.acceleration.x = -10;
    ++numKeysPressedX;
  } else if (keyCode == DOWN || key == 's') {
    game.ball.acceleration.y = 10;
    ++numKeysPressedY;
  } else if (keyCode == UP || key == 'w') {
    game.ball.acceleration.y = -10;
    ++numKeysPressedY;
  }
  
  // To be added when physics is computed correctly
  
  //if (key == ' ') {
  //  game.ball.jump();
  //}
}

void keyReleased() {
  // When a movement key is released, decrements the counter of pressed keys
  // and if all the keys on the axis are released, sets the ball's acceleration to 0
  // X axis
  if (keyCode == RIGHT || keyCode == LEFT || key == 'd' || key == 'a') {
    if (--numKeysPressedX <= 0) {
      game.ball.acceleration.x = 0;
    }
  }
  // Y axis
  if (keyCode == DOWN || keyCode == UP || key == 's' || key == 'w') {
    if (--numKeysPressedY <= 0) {
      game.ball.acceleration.y = 0;
    }
  }

  // If a movement key is released but there are still other movement keys pressed on that
  // axis (direction), a set amount of acceleration is substracted from ball's acceleration
  // on that axis.
  if ((keyCode == RIGHT || key == 'd') && numKeysPressedX > 0) {
    game.ball.acceleration.x = -10;
  } else if ((keyCode == LEFT || key == 'a') && numKeysPressedX > 0) {
    game.ball.acceleration.x = 10;
  } else if ((keyCode == DOWN || key == 's') && numKeysPressedY > 0) {
    game.ball.acceleration.y = 10;
  } else if ((keyCode == UP || key == 'w') && numKeysPressedY > 0) {
    game.ball.acceleration.y = -10;
  }
}
