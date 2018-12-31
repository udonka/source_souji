class Ball{
  private Vec pos = new Vec();
  private Vec vel = new Vec();
  
  public Ball(Vec pos,Vec vel){
    this.pos = pos;
    this.vel = vel;
  }
  
  public void reflect(){
    float[] xPosAndVel = reflectFunc(this.pos.x, this.vel.x, 0, width);
    this.pos.x = xPosAndVel[0]; //pos
    this.vel.x = xPosAndVel[1]; //vel
    
    float[] yPosAndVel = reflectFunc(this.pos.y, this.vel.y, 0, height);
    this.pos.y = yPosAndVel[0]; //pos
    this.vel.y = yPosAndVel[1]; //vel
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
    
    this.pos.add(this.vel);
  }
  
  public void draw(){
    fill(this.pos.x/width * 100,this.pos.y/height * 100,100);
    stroke(0,0,80);
    strokeWeight(5);

    ellipse(this.pos.x, this.pos.y , 30, 30);
  }
}