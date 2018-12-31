ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(300,300);
  background(255,255,255);

  for(int i = 0; i < 5; i++){
    Ball newBall = new Ball(
      width/2+random(5),
      height/2+random(5),
      random(5),
      random(5)
    );
    balls.add(newBall);
  }
}

void draw(){
  background(255,255,255);
  
  fill(255,0,0);
  stroke(255,255,0);
  strokeWeight(5);

  for(Ball ball : balls){
    ball.move();
    ball.draw();
  }
}

class Ball{
  private float posX = 0;
  private float posY = 0;
  private float velX = 0;
  private float velY = 0;

  public Ball(float posX, float posY, float velX, float velY){
    this.posX = posX;
    this.posY = posY;
    this.velX = velX;
    this.velY = velY;
  }

  public void move(){
    if(this.posX < 0)
    {
      this.posX = - this.posX;
      this.velX = - this.velX;
    }
    else if(this.posX > width){
      this.posX = width - ( this.posX - width );
      this.velX = - this.velX;
    }
    
    if(this.posY < 0)
    {
      this.posY = - this.posY;
      this.velY = - this.velY;
    }
    else if(this.posY> height){
      this.posY = height - ( this.posY - height );
      this.velY = - this.velY;
    }
    
    this.posX += this.velX;
    this.posY += this.velY;
  }
  
  public void draw(){
    ellipse(this.posX, this.posY , 30, 30);
  }
}