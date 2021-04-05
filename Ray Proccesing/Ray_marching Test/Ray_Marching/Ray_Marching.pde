Partickle partickle;
Box box;
Line line;
Circle circle;
void setup(){
  size(800,500);
  circle = new Circle(500, 200, 50);
  box = new Box(400, 200, 50, 200);
  partickle = new Partickle(0,0);
  line = new Line(50, 60, 100, 200);
}

void draw(){
  background(0);
  //stroke(255);
  //strokeWeight(8);
  //line(circle.pos.x, circle.pos.y, circle.centre.x, circle.centre.y);
  partickle.setPos(mouseX, mouseY);
  partickle.show();
  float r = dstToBox(partickle.pos, box.centre, box.size);
  r = min(dstToCircle(partickle.pos, circle.centre, circle.r),r);
  r = min(dstToLine(partickle.pos,line.dot1,line.dot2),r);
  partickle.showRange(r);
  box.show();
  circle.show();
  line.show();
}
