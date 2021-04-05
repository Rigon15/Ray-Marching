class Partickle{
  PVector pos;
  Partickle(int x, int y){
    this.pos = new PVector(x,y);
  }
  
  void setPos(int x, int y){
    this.pos = new PVector(x,y);
  }
  
  void show(){
    push();
    stroke(255);
    strokeWeight(8);
    point(this.pos.x, this.pos.y);
    pop();
  }
  
  void showRange(float r){
    push();
    stroke(255);
    noFill();
    strokeWeight(3);
    circle(this.pos.x, this.pos.y, r*2);
    pop();
  }
    
}
