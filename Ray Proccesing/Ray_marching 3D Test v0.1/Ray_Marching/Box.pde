class Box{
  PVector pos;
  PVector size;
  PVector centre;
  Box(int x,int y, int z, int sizeX, int sizeY, int sizeZ){
    this.pos = new PVector(x, y, z);
    this.size = new PVector(sizeX, sizeY, sizeZ);
    this.centre = this.pos.copy().add(this.size.copy().div(2)); 
  }
  
  void show(){
    push();
    stroke(255);
    noFill();
    strokeWeight(3);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
    pop();
  }
}
