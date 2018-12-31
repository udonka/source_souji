class Ball{
  private Vec pos = new Vec();
  private Vec vel = new Vec();
  private float theta = random(5);
  private float spin = random(0.3);
  private Vec acc = new Vec(0, 1);
  
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
    
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }
  
  public void draw(){
    fill(0,0,0);

    pushMatrix();
      translate(this.pos.x, this.pos.y);
      scale(0.5, 0.5);
      rotate(this.theta);
      this.drawShuriken();

    popMatrix();

    this.theta += this.spin;
  }
  
  private void drawShuriken(){
    beginShape();
      vertex(20, 20);
      vertex(100, 0);
      vertex(20, -20);
      vertex(0, -100);
      vertex(-20, -20);
      vertex(-100, 0);
      vertex(-20, 20);
      vertex(0, 100);
    endShape(CLOSE);
    
    ellipse(0, 0, 30, 30);    
  }
}