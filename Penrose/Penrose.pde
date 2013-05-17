// Penrose Tile Generator
// Using "ArrayList" recursion technique: http://natureofcode.com/book/chapter-8-fractals/#chapter08_section4
// Penrose Algorithm from: http://preshing.com/20110831/penrose-tiling-explained
// Daniel Shiffman
// May 2013

float goldenRatio;
ArrayList<Triangle> tris;

void setup() {
  size(600, 360);
  goldenRatio = (1.0 + sqrt(5)) / 2.0;

  tris = new ArrayList<Triangle>();
  seed1();
  //seed2();
}

void mousePressed() {
  generate();
}

void draw() {
  background(255);
  translate(width/2, height/2);

  for (Triangle t : tris) {
    t.display();
  }
}

void generate() {
  ArrayList<Triangle> next = new ArrayList<Triangle>();
  for (Triangle t : tris) {
    Triangle[] more = t.subdivide1();
    //Triangle[] more = t.subdivide2();
    for (int i = 0; i < more.length; i++) {
      next.add(more[i]);
    }
  }
  tris = next;
}

void seed1() {
  for (int i = 0; i < 10; i++) {
    PVector a = new PVector();
    PVector b = PVector.fromAngle((2*i - 1) * PI / 10);
    PVector c = PVector.fromAngle((2*i + 1) * PI / 10);
    b.mult(240);
    c.mult(240);
    if (i % 2 == 0) {
      tris.add(new Triangle(0, a, b, c));
    } else {
      tris.add(new Triangle(0, a, c, b));
    }
  }
}

void seed2() {
  for (int i = 0; i < 10; i++) {
    PVector a = new PVector();
    PVector b = PVector.fromAngle((2*i - 1) * PI / 10);
    PVector c = PVector.fromAngle((2*i + 1) * PI / 10);
    b.mult(240);
    c.mult(240);
    if (i % 2 == 0) {
      tris.add(new Triangle(0, b, a, c));
    } else {
      tris.add(new Triangle(0, c, a, b));
    }
  }
}

