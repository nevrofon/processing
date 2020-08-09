void setup() {
  size(2000, 2000);
  pixelDensity(1);
}

void draw() {
  background(255);
  for (int i = 200; i < 300; i++) {
    foo(i);
  }
  
  noLoop();
  save("connection_lines.jpg");
}

void foo(long seed) {
  randomSeed(seed);
  stroke(0, 0, 0, 16);
  strokeWeight(2);
  float x1 = 1000;
  float y1 = 0;
  float x2 = x1;
  float y2 = y1;
  int previousDirection = 0;
  for (int i = 0; i < 100; i++) {
    float r = floor(random(20)) * 10;
    int direction = floor(random(4));
    while (
      ((direction == 0 || direction == 1) && (previousDirection == 0 || previousDirection == 1)) ||
      ((direction == 2 || direction == 3) && (previousDirection == 2 || previousDirection == 3))
      ) {
      direction = floor(random(3));
    }
    previousDirection = direction;
    
    if (direction == 0) {
      x2 = x1 + r;
      y2 = y1;
    } else if (direction == 1) {
      x2 = x1 - r;
      y2 = y1;
    } else if (direction == 2) {
      x2 = x1;
      y2 = y1 + r;
    } else if (direction == 3) {
      x2 = x1;
      y2 = y1 - r;
    }
    println(direction, r, x1, y1, x2, y2);
    line(x1, y1, x2, y2);
    x1 = x2;
    y1 = y2;
  }
}
