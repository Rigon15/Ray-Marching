class Line{
  PVector dot1;
  PVector dot2;
  Line(int x1, int y1, int x2, int y2){
    this.dot1 = new PVector(x1,y1);
    this.dot2 = new PVector(x2,y2);
  }
  
  void show(){
    push();
    stroke(255);
    strokeWeight(3);
    line(this.dot1.x, this.dot1.y, this.dot2.x, this.dot2.y);
    pop();
  }
}
