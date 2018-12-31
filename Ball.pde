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
  
  public void reflect(){
    float[] xPosAndVel = reflectFunc(this.posX, this.velX, 0, width);
    this.posX = xPosAndVel[0]; //pos
    this.velX = xPosAndVel[1]; //vel
    
    float[] yPosAndVel = reflectFunc(this.posY, this.velY, 0, height);
    this.posY = yPosAndVel[0]; //pos
    this.velY = yPosAndVel[1]; //vel
  }
  
  public float[] reflectFunc(float pos, float vel, float min, float max){
    float newPos = pos;
    float newVel = vel;
    if(pos < min) {
      newPos = min - ( pos - min );
      newVel = - vel;
    }
    else if(pos > max){
      newPos = max - ( pos - max );
      newVel = - vel;
    }
    return new float[]{newPos,newVel};
  }
  
  public void move(){
    this.reflect();
    
    this.posX += this.velX;
    this.posY += this.velY;
  }
  
  public void draw(){
    fill(255,0,0);
    stroke(255,255,0);
    strokeWeight(5);

    ellipse(this.posX, this.posY , 30, 30);
  }
}