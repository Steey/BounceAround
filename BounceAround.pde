PShape sh;
Game game;

int numKeysPressedX = 0;
int numKeysPressedY = 0;

void setup() {
  //fullScreen(P2D);
  size(800,600,P2D); 
  
  game = new Game(); //<>//
  game.initialize();
}


void draw() {
  background(128);
  
  game.update();   //<>//
  game.boundingBox();
  game.display(); //<>//
  
  println(frameRate);
}






void keyPressed() {
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
}

void keyReleased() {
  if (keyCode == RIGHT || keyCode == LEFT || key == 'd' || key == 'a') {
    if (--numKeysPressedX <= 0) {
      game.ball.acceleration.x = 0;
    }
  }
  
  if (keyCode == DOWN || keyCode == UP || key == 's' || key == 'w') {
    if (--numKeysPressedY <= 0) {
      game.ball.acceleration.y = 0;
    }
  }

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
