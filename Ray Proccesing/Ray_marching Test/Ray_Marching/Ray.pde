class Ray{
  PVector pos;
  PVector dir;
  Ray(PVector pos, float angle){
    this.pos = pos.copy();
    this.dir = PVector.fromAngle(angle);
  }
  
  void show(){
    
  }
  
}
