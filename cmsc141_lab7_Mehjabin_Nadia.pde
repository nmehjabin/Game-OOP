/* Nadia Mehjabin  <nm6088@bard.edu>
 Nov 12 2021
 CMSC 141
 Lab 7 : GAME
 I collaborated on this assignment with assistance from tutors.
 */

int score = 0;  //this variable counts the score and everytime the ball hits any of 2 paddles the scores increases//

// declaring a Ball class where ball is the object//

public class Ball {
  float x; 
  float y;
  float x_step; 
  float y_step;
  float ball_r = 13;

  //constructor of the ball object which takes 4 parameters//

  Ball (float ball_x, float ball_y, float ball_x_step, float ball_y_step) {
    x = ball_x;                 //x position of the ball//
    y = ball_y;                 //y position of the ball//
    x_step = ball_x_step;       //step from x position to move//
    y_step = ball_y_step;       //step from y position to move//
  }

  //declaring moving methods to move around the ball//

  void moving() {
    this.x = this.x + this.x_step;
    this.y = this.y + this.y_step;

    //checks if the ball goes out from the width of the window, if so reset its step//

    if  (x - ball_r < 0 || x + ball_r > width) {
      x_step = -x_step;
    }
    if (y - ball_r < 0 ) {
      y_step = -y_step;
    }
  }

  //display the ball //

  void display() {
    noStroke();
    fill(196, 0, 0);
    ellipse(this.x, this.y, ball_r*2, ball_r*2);
  }

  void reset() {
    this.x = random(ball_r, width - ball_r);
    this.y = random(ball_r, height/2 );
    this.x_step = random(-3, 3);
    this.y_step = random(1, 3);
  }
}

//paddle class where the ball will touch its edges//

public class Paddle {
  float x; 
  float step;
  float paddle_h = 16;
  float paddle_w = 5 * paddle_h;

  //constructor for paddle//

  Paddle(float paddle_x, float paddle_step ) {
    x = paddle_x;
    step = paddle_step;
  }

  //draws the paddle in rectangle shape//

  void display() {
    stroke(24);
    fill(64);
    rect(this.x, height-paddle_h, paddle_w, paddle_h);
  }

  void moving() {
    this.x = this.x + this.step;
    // the paddle moves step number every time key is pressed//
  }
}


Ball ball;
Paddle paddle1;
Paddle paddle2;

PImage bgImage;  //shows a jpg image as background//

void setup() {
  size(600, 300);

  //changing the background//
  bgImage = loadImage("space.jpeg");   // loading the background image//

  //calling the classes//
  ball = new Ball(width/2, height/2, random(-3, 3), random(1, 3));
  paddle1 = new Paddle(width/2, 0);
  paddle2 = new Paddle(width/4, 0);
}

// statements how paddle1 will move which is LEFT and RIGHT key, and paddle2 will move by UP and DOWN key//

void keyPressed() {
  if (key == CODED && keyCode == LEFT) {
    paddle1.step = -3;
  } else if (key == CODED && keyCode == RIGHT) {
    paddle1.step = 3;
  } else if (key == ' ') {
    ball.reset();
  }

  if (key == CODED && keyCode == UP) {
    paddle2.step = 3;
  } else if (key == CODED && keyCode == DOWN) {
    paddle2.step = -3;
  } else if (key == ' ') {
    ball.reset();
  }
}


void keyReleased() {
  paddle1.step = 0;
  paddle2.step = 0;
}

// https://yal.cc/rectangle-circle-intersection-test//
// returns true if a rectangle (rx, ry, rw, rh) intersects with a circle (cx, cy, cr)
boolean rectIsOnCircle(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
  float nx = max(rx, min(cx, rx + rw));    // declared nx and ny maximum, as a result the score will increase when the ball will touch the edges of the paddle//
  float ny = max(ry, min(cy, ry + rh));
  float dx = cx - nx;
  float dy = cy - ny;
  return (dx * dx + dy * dy) < cr * cr;
}


void draw() {

  image(bgImage, 0, 0, width, height); // calling the image to show as background//

  //calling all class methods//
  ball.moving();
  ball.display();
  
  paddle1.moving();
  paddle1.display();
  paddle2.display();
  paddle2.moving();

  //checking the bool function if the paddle touches the ball's edges which results scoring, and based on that changing ball's location vertically // 

  if (rectIsOnCircle(paddle1.x, height - paddle1.paddle_h, paddle1.paddle_w, paddle1.paddle_h, 
    ball.x, ball.y, ball.ball_r)) {
    ball.y_step = -ball.y_step;
    score++;
  } else if (rectIsOnCircle(paddle2.x, height - paddle2.paddle_h, paddle2.paddle_w, paddle2.paddle_h, 
    ball.x, ball.y, ball.ball_r)) {
    ball.y_step = -ball.y_step;
    score++;
  }
  //if the ball goes out of the window, the game is over//
  if (ball.y > height+15) { 
    // this statement checks the ball's y position//
    textSize(40);
    fill(204, 10, 0);
    text("Game Over", width/2 - 100, height/2);
    // Once Game is over, Stop the draw loop
    noLoop();
  }
  // score display
  fill(178, 194, 72); 
  textSize(32);
  text(score, 32, 40);
}
