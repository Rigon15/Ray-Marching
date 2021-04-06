class Partickle{
  PVector pos;
  Ray[] rays;
  float step;
  float angle;
  float angleOffset;
  //float[][] renderedImage = new float[width*height][1]; 
  Partickle(int x, int y, int z, float step, float angle){
    this.pos = new PVector(x,y,z);
    this.step = step;
    this.angle = angle;
    this.angleOffset = 0;
    this.rays = new Ray[int((width/2)/this.step)];
    float delta = this.angle/(width/this.step);
    for(int i = 0; i<this.rays.length; i++){
      this.rays[i] = new Ray(this.pos, radians(i*delta));
    }
  }
  
  void setPos(int x, int y, int z){
    this.pos = new PVector(x,y,z);
  }
  
  void updateRays(){
    for(int i = 0; i<this.rays.length; i++){
      this.rays[i].setPos(this.pos);
    }
  }
  void rotate(float a){
    this.angleOffset += radians(a);
    for(int i = 0; i<this.rays.length; i++){
      this.rays[i].setDir(this.rays[i].angle+angleOffset);
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
  void renderImage(){
    //colorMode(HSB);
    loadPixels();
    for(int i = 0; i<this.rays.length; i++){
      for(float j = 0; j<deep; j +=step){
        setPos((int)this.pos.x,(int)this.pos.y,(int)j);
        updateRays();
        //println(this.pos);
        float d = getDstFromPosAndDir(this.rays[i].pos,this.rays[i].dir,boxes,circles,lines,this.rays[i].maxSteps,this.rays[i].dLim);
        push();
        noStroke();
        float col = map(d, 0, deep, 255, 0);
        fill(col);
        //strokeWeight(8);
        //println(int(j*width+i*this.step+xOffset));
        pixels[int(j*width+i*this.step+xOffset)] = color(col);
        
        //rect(xOffset+i*step,yOffset+j,step,step);
        pop();
        //this.rays[i].drawPoint(boxes, circles, lines);
        //showCountur(boxes,circles,lines);
      }
    }
    updatePixels();
    println("Done");
  }
  
  void getImage(){
    
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
