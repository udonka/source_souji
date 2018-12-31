ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(300,300);
  background(255,255,255);

  for(int i = 0; i < 5; i++){
    Ball newBall = new Ball();

    newBall.posX = width/2+random(5);
    newBall.posY = height/2+random(5);
    newBall.velX = random(5);
    newBall.velY = random(5);

    balls.add(newBall);
  }
}

void draw(){
  background(255,255,255);
  
  fill(255,0,0);
  stroke(255,255,0);
  strokeWeight(5);

  for(Ball ball : balls){
    if(ball.posX < 0)
    {
      ball.posX = - ball.posX;
      ball.velX = - ball.velX;
    }
    else if(ball.posX > width){
      ball.posX = width - ( ball.posX - width );
      ball.velX = - ball.velX;
    }
    
    if(ball.posY < 0)
    {
      ball.posY = - ball.posY;
      ball.velY = - ball.velY;
    }
    else if(ball.posY> height){
      ball.posY = height - ( ball.posY - height );
      ball.velY = - ball.velY;
    }
    
    ball.posX += ball.velX;
    ball.posY += ball.velY;    

    ellipse(ball.posX, ball.posY , 30, 30);
  }
}

class Ball{
  public float posX = 0;
  public float posY = 0;
  public float velX = 0;
  public float velY = 0;
}