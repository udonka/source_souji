ArrayList<float[]> balls = new ArrayList<float[]>();

void setup(){
  size(300,300);
  background(255,255,255);

  for(int i = 0; i < 5; i++){
    float newBall[] = new float[4];

    newBall[0] = width/2+random(5);
    newBall[1] = height/2+random(5);
    newBall[2] = random(5);
    newBall[3] = random(5);

    balls.add(newBall);
  }
}

void draw(){
  background(255,255,255);
  
  fill(255,0,0);
  stroke(255,255,0);
  strokeWeight(5);

  for(float[] ball : balls){
    if(ball[0] < 0)
    {
      ball[0] = - ball[0];
      ball[2] = - ball[2];
    }
    else if(ball[0] > width){
      ball[0] = width - ( ball[0] - width );
      ball[2] = - ball[2];
    }
    
    if(ball[1] < 0)
    {
      ball[1] = - ball[1];
      ball[3] = - ball[3];
    }
    else if(ball[1]> height){
      ball[1] = height - ( ball[1] - height );
      ball[3] = - ball[3];
    }
    
    ball[0] += ball[2];
    ball[1] += ball[3];    

    ellipse(ball[0], ball[1] , 30, 30);
  }
}