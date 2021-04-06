class Ray{
  PVector pos;
  PVector dir;
  int maxSteps;
  float dLim;
  Ray(PVector pos, float angle){
    this.pos = pos.copy();
    this.dir = PVector.fromAngle(angle).normalize();
    this.maxSteps = 255;
    this.dLim = 1;
  }
  
  void setPos(int x, int y){
    this.pos = new PVector(x,y);
  }
  
  void setPos(PVector pos){
    this.pos = pos.copy();
  }
  
  void setMaxSteps(int a){
    this.maxSteps = a;
  }
  
  void drawPoint(Box boxes[], Circle circles[], Line lines[]){
    //getClosedDst(boxes,circles,lines);
    float d = getDstFromPosAndDir(this.pos,this.dir,boxes,circles,lines,this.maxSteps,this.dLim);
    push();
    stroke(255,0,0);
    strokeWeight(10);
    translate(this.pos.x, this.pos.y);
    point(this.dir.x*d,this.dir.y*d);
    pop();
  }
  
  
  void show(){
    push();
    stroke(255);
    strokeWeight(1);
    translate(this.pos.x, this.pos.y);
    line(0,0,dir.x*10,dir.y*10);
    pop();
  }
  
}
