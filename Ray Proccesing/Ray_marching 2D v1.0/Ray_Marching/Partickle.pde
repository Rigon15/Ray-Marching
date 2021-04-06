class Partickle{
  PVector pos;
  Ray[] rays;
  float step;
  Partickle(int x, int y, float step){
    this.pos = new PVector(x,y);
    this.rays = new Ray[int(360/step)];
    for(int i = 0; i<this.rays.length; i++){
      this.rays[i] = new Ray(this.pos, radians(i*step));
    }
  }
  
  void setPos(int x, int y){
    this.pos = new PVector(x,y);
  }
  
  void updateRays(){
    for(int i = 0; i<this.rays.length; i++){
      this.rays[i].setPos(this.pos);
    }
  }
  
  void showRays(){
    for(int i = 0; i<this.rays.length; i++){
      this.rays[i].show();
    }
  }
  void showCountur(Box boxes[], Circle circles[], Line lines[]){
    for(int i = 0; i<this.rays.length; i++){
      this.rays[i].drawPoint(boxes, circles, lines);
    }
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
