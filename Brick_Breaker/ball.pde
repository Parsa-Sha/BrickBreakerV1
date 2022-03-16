class Ball {
   
  Ball() {
    bx = width/2;
    by = height/2;
    bvx = 0;
    bvy = 3;
    bd = 16;
  }
 
  void show() {
    image(ballImage, bx, by);
  }
  
  void act() {
    bx = bx + bvx; // Acceleration
    by = by + bvy;
    
    if(bx < bd/2 || bx > width-bd/2){ // Bouncing off walls
      bvx = -bvx;
    }
    
    if(by < bd/2){ // Bouncing off ceiling
      bvy = -bvy;
    }
    
    if(by > height-bd/2) { // If game has lost
      bx = width/2;
      by = height/2;
      bvx = 0;
      bvy = 3;
      mode = GAMEOVER;
    }
    
    if(by + bd/2 > myPaddle.y - myPaddle.paddleHeight && by + bd/2 < myPaddle.y && myPaddle.x + myPaddle.paddleWidth >= bx && myPaddle.x - myPaddle.paddleWidth <= bx) { // Paddle bounding
      bvy = ( (by) - (myPaddle.y) ) * 0.25;
      bvx = ( (bx) - (myPaddle.x) ) * (0.25 * min(1, max( 0,  abs( bx - myPaddle.x ) / (myPaddle.paddleWidth / 2) ) ) ); // Big old formula which calculates angle and speed based on distance to edge of paddle
    }
  }
}
