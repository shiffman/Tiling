int[] colors = {
  color(255, 0, 0), color(0, 0, 255)
};

class Triangle {
  PVector a;
  PVector b;
  PVector c;
  color col;


  Triangle(int col_, PVector a_, PVector b_, PVector c_) {
    col = col_;
    a = a_.get();
    b = b_.get();
    c = c_.get();
  }

  void display() {
    noStroke();
    fill(colors[col]);
    triangle(a.x, a.y, b.x, b.y, c.x, c.y);
    //fill(0,0,255);
    //ellipse(a.x,a.y,4,4);
    //ellipse(b.x,b.y,4,4);
    //ellipse(c.x,c.y,4,4);
  }

  Triangle[] subdivide1() {
    if (col == 0) {
      // Subdivide red triangle
      PVector p = PVector.sub(b, a);
      p.div(goldenRatio);
      p.add(a);
      Triangle[] result = new Triangle[2];
      result[0] = new Triangle(0, c, p, b);
      result[1] = new Triangle(1, p, c, a);
      return result;
    } else {
      // Subdivide blue triangle
      PVector q = PVector.sub(a, b);
      q.div(goldenRatio);
      q.add(b);
      PVector r = PVector.sub(c, b);
      r.div(goldenRatio);
      r.add(b);
      Triangle[] result = new Triangle[3];
      result[0] = new Triangle(1, r, c, a);
      result[1] = new Triangle(1, q, r, b);
      result[2] = new Triangle(0, r, q, a);
      return result;
    }
  }

  Triangle[] subdivide2() {
    if (col == 0) {
      // Subdivide red (half kite) triangle
      PVector q = PVector.sub(b, a);
      q.div(goldenRatio);
      q.add(a);
      PVector r = PVector.sub(c, b);
      r.div(goldenRatio);
      r.add(b);
      Triangle[] result = new Triangle[3];
      result[0] = new Triangle(1, r, q, b);
      result[1] = new Triangle(0, q, a, r);
      result[2] = new Triangle(0, c, a, r);
      return result;
    } else {
      // Subdivide blue (half dart) triangle
      PVector p = PVector.sub(a, c);
      p.div(goldenRatio);
      p.add(c);
      Triangle[] result = new Triangle[2];
      result[0] = new Triangle(1, b, p, a);
      result[1] = new Triangle(0, p, c, b);
      return result;
    }
  }
}

