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
  
  for(Ball ball : balls){
    ball.move();
  }
  
  for(Ball ball : balls){
    ball.draw();
  }

}