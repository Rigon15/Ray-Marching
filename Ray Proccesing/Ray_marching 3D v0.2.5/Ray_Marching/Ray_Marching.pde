Partickle partickle;
Box boxes[];
Line lines[];
Circle circles[];
//Ray ray;
int s2DsizeX = 0;
int s2DsizeY = 0;
int s3DsizeX = 0;
int s3DsizeY = 0;
int xOffset = 0;
int yOffset = 0;
int deep = 0;
void setup(){
  size(1000,500);
  deep = 500;
  s2DsizeX = width/2;
  s2DsizeY = height;
  s3DsizeX = width;
  s3DsizeY = height;
  xOffset = s3DsizeX-s2DsizeX;
  yOffset = s3DsizeY-s2DsizeY;
  circles = new Circle[1]; 
  boxes = new Box[2];
  lines = new Line[2];
  partickle = new Partickle(0,0,deep/2,1,120);
  //ray = new Ray(partickle.pos,0);
  generateRandomBoxes();
  generateRandomCircles();
  generateRandomLines();
  //lines[lines.length-1] = new Line(0,0,s2DsizeX,0);
  //lines[lines.length-1-1] = new Line(s2DsizeX,0,s2DsizeX,s2DsizeY);
  //lines[lines.length-1-2] = new Line(0,s2DsizeY,s2DsizeX,s2DsizeY);
  //lines[lines.length-1-3] = new Line(0,s2DsizeY,0,0);
  //noLoop();
  partickle.rotate(45);
  partickle.getImage();
  
}

void draw(){
  if(keyPressed){
    if(int(key) == 97){
      partickle.rotate(-5);
    }else{
      if(int(key) == 100){
        partickle.rotate(5);
      }
    }
    if(int(key) == 10){
      partickle.getImage();
    }
    println(int(key),int(keyCode));
  }
  
  background(0);
  //stroke(255);
  //strokeWeight(8);
  //line(circle.pos.x, circle.pos.y, circle.centre.x, circle.centre.y);
  //partickle.setPos(0, height/2 ,deep/2);
  partickle.setPos(mouseX, mouseY ,deep/2);
  partickle.show();
  //ray.setPos(partickle.pos);
  //ray.show();
  //ray.drawPoint(boxes,circles,lines);
  boxesShow();
  circlesShow();
  linesShow();
  partickle.updateRays();
  partickle.showRays();
  //float r = getClosedDst(partickle.pos,boxes,circles,lines);
  //float r = dstToBox(partickle.pos, box.centre, box.size);
  //r = min(dstToCircle(partickle.pos, circle.centre, circle.r),r);
  //r = min(dstToLine(partickle.pos,line.dot1,line.dot2),r);
  
  partickle.showCountur(boxes,circles,lines);
  //partickle.showRange(r);
  fill(0);
  rect(xOffset,0,xOffset,height);
  partickle.renderImage();
  //box.show();
  //circle.show();
  //line.show();
  stroke(125,125,125);
  strokeWeight(12);
  line(s2DsizeX,0,s2DsizeX,s2DsizeY);
  //partickle = new Partickle(0,0,deep/2,5,20+frameCount*10);
  //println(20+frameCount*10);
  //partickle.rotate((90+20-frameCount*10)/2);
  ////partickle.rotate(-frameCount);
}

void generateRandomBoxes(){
  for(int i = 0; i<boxes.length; i++){
    boxes[i] = new Box((int)random(s2DsizeX), (int)random(s2DsizeY), (int)random(deep), (int)random(50,200), (int)random(50,200), (int)random(50,200));
  }
}
void boxesShow(){
  for(int i = 0; i<boxes.length; i++){
    boxes[i].show();
  }
}

void generateRandomCircles(){
  for(int i = 0; i<circles.length; i++){
    circles[i] = new Circle((int)random(s2DsizeX), (int)random(s2DsizeY), (int)random(deep), random(50,200));
  }
}
void circlesShow(){
  for(int i = 0; i<circles.length; i++){
    circles[i].show();
  }
}

void generateRandomLines(){
  for(int i = 0; i<lines.length; i++){
    lines[i] = new Line((int)random(s2DsizeX), (int)random(s2DsizeY), (int)random(deep), (int)random(s2DsizeX), (int)random(s2DsizeY), (int)random(deep));
  }
}
void linesShow(){
  for(int i = 0; i<lines.length; i++){
    lines[i].show();
  }
}
