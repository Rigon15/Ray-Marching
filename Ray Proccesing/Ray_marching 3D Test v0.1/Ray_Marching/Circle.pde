class Circle{
  PVector pos;
  PVector centre;
  float r;
  Circle(int x, int y, int z, float r){
    this.pos = new PVector(x, y, z);
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
