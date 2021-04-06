Partickle partickle;
Box boxes[];
Line lines[];
Circle circles[];
//Ray ray;
void setup(){
  size(800,500);
  circles = new Circle[2]; 
  boxes = new Box[2];
  lines = new Line[2+4];
  partickle = new Partickle(0,0,1);
  //ray = new Ray(partickle.pos,0);
  generateRandomBoxes();
  generateRandomCircles();
  generateRandomLines();
  lines[lines.length-1] = new Line(0,0,width,0);
  lines[lines.length-1-1] = new Line(width,0,width,height);
  lines[lines.length-1-2] = new Line(0,height,width,height);
  lines[lines.length-1-3] = new Line(0,height,0,0);
}

void draw(){
  background(0);
  //stroke(255);
  //strokeWeight(8);
  //line(circle.pos.x, circle.pos.y, circle.centre.x, circle.centre.y);
  partickle.setPos(mouseX, mouseY);
  partickle.show();
  //ray.setPos(partickle.pos);
  //ray.show();
  //ray.drawPoint(boxes,circles,lines);
  boxesShow();
  circlesShow();
  linesShow();
  partickle.updateRays();
  partickle.showRays();
  partickle.showCountur(boxes,circles,lines);
  float r = getClosedDst(partickle.pos,boxes,circles,lines);
  //float r = dstToBox(partickle.pos, box.centre, box.size);
  //r = min(dstToCircle(partickle.pos, circle.centre, circle.r),r);
  //r = min(dstToLine(partickle.pos,line.dot1,line.dot2),r);
  partickle.showRange(r);
  //box.show();
  //circle.show();
  //line.show();
}

void generateRandomBoxes(){
  for(int i = 0; i<boxes.length; i++){
    boxes[i] = new Box((int)random(width), (int)random(height), (int)random(50,200), (int)random(50,200));
  }
}
void boxesShow(){
  for(int i = 0; i<boxes.length; i++){
    boxes[i].show();
  }
}

void generateRandomCircles(){
  for(int i = 0; i<circles.length; i++){
    circles[i] = new Circle((int)random(width), (int)random(height), random(50,200));
  }
}
void circlesShow(){
  for(int i = 0; i<circles.length; i++){
    circles[i].show();
  }
}

void generateRandomLines(){
  for(int i = 0; i<lines.length; i++){
    lines[i] = new Line((int)random(width), (int)random(height), (int)random(width), (int)random(height));
  }
}
void linesShow(){
  for(int i = 0; i<lines.length; i++){
    lines[i].show();
  }
}
