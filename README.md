# Game-OOP
Author

Nadia Mehjabin
Email: nm6088@bard.edu
Date: November 12, 2021
Course: CMSC 141

Description:

This project is a simple Pong-like game implemented in Java using the Processing library. The game involves a ball that bounces off two paddles controlled by the user. The objective is to keep the ball in play and prevent it from going off the screen. Each time the ball hits a paddle, the score increases. If the ball goes off the bottom of the screen, the game ends.

Features:

- Ball and paddle objects implemented using classes.

- Realistic ball movement and collision detection with paddles and screen boundaries.

- Background image for the game environment.

- Score tracking and game over display.

- Keyboard controls for moving the paddles and resetting the ball.

Classes:

Ball-> Represents the ball in the game. It includes:
- Properties for position (x, y), movement steps (x_step, y_step), and radius (ball_r).
- Methods for moving the ball (moving), displaying the ball (display), and resetting the ball's position and movement (reset).

Paddle-> Represents a paddle controlled by the player. It includes:
- Properties for position (x), movement step (step), and dimensions (paddle_h, paddle_w).
- Methods for displaying the paddle (display) and moving the paddle based on user input (moving).

Setup and Execution:

Ensure you have the Processing IDE installed.
Save the provided code in a .pde file.
Place the background image (space.jpeg) in the same directory as the code file.
Open the .pde file in the Processing IDE.
Run the sketch by clicking the play button.

Controls:
- Left Arrow: Move Paddle 1 to the left.
- Right Arrow: Move Paddle 1 to the right.
- Up Arrow: Move Paddle 2 down.
- Down Arrow: Move Paddle 2 up.
- Spacebar: Reset the ball's position.

Scoring:
The score increases by 1 each time the ball hits either paddle.
The game ends when the ball goes off the bottom of the screen.

Collision Detection:
The function rectIsOnCircle checks if a rectangular paddle intersects with the circular ball, using a rectangle-circle intersection algorithm.

References
Collision detection algorithm: yal.cc/rectangle-circle-intersection-test

License

This project is licensed under the MIT License. See the LICENSE file for more details.


