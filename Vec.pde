class Vec{
  public float x;
  public float y;
  
  public Vec(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public Vec(){
    this.x = 0;
    this.y = 0;
  }
 
  public void Vec(Vec otherVec){
    this.x = otherVec.x;
    this.y = otherVec.y;
  }
  
  public Vec add(Vec other){
    this.x += other.x; 
    this.y += other.y; 
    return this;
  } 
  
  public Vec sub(Vec other){
    this.add(other.mul(-1));
    return this;
  }
  
  public Vec mul(float k){
    this.x *= k;
    this.y *= k;
    return this;
  }
}