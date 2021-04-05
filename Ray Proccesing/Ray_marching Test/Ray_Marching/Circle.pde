class Circle{
  PVector pos;
  PVector centre;
  float r;
  Circle(int x, int y, float r){
    this.pos = new PVector(x, y);
    this.r = r;
    this.centre = pos.copy(); 
  }
  
  void show(){
    push();
    stroke(255);
    noFill();
    strokeWeight(3);
    circle(this.pos.x, this.pos.y, this.r*2);
    pop();
  }
}
