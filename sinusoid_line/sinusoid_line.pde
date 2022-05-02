void setup() {
  size(500, 500);
}

float periodicFunction(float p) {
  return 1*sin(TWO_PI * p);
}

float offset(float x, float y) {
  return 0.005 * (x + 2 * y);
}

int numFrames = 80;

void draw() {
  background(0);
  stroke(255);
  
  float t = 1.0*frameCount/numFrames;
  
  int m = 40;

  for (int i = 0; i < m; i++) {
    float x = map(i, 0, m - 1, 0, width);
    for (int j = 0; j < m; j++) {
      float y = map(j, 0, m - 1, 0, height);
      
      pushMatrix();
      translate(x,y);
      
      float rotation = periodicFunction(t - offset(x,y));
      rotate(rotation);
      
      line(-5, 0, 5, 0);
      popMatrix();
    }
  }
  
  if (frameCount <= numFrames) {
    saveFrame("fr###.gif");
  }
  
  if (frameCount == numFrames) {
    println("All frames saved");
  }
}
