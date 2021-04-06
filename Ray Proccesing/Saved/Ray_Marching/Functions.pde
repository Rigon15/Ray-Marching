float length(PVector a){
  return sqrt(sq(a.x) + sq(a.y) + sq(a.z));
}
PVector abs(PVector a){
  return new PVector(abs(a.x), abs(a.y), abs(a.z));
}
float min(PVector a){
  return min(a.x, a.y, a.z);
}
PVector min(PVector a, float lim){
  return new PVector(min(a.x,lim), min(a.y,lim), min(a.z,lim));
}
float max(PVector a){
  return max(a.x, a.y, a.z);
}
PVector max(PVector a, float lim){
  return new PVector(max(a.x,lim), max(a.y,lim), max(a.z,lim));
}

float dstToBox(PVector cameraOrigin, PVector boxCentre, PVector boxSize){
  PVector Pos = boxCentre.copy().sub(cameraOrigin);
  PVector c = abs(Pos);
  PVector d = c.sub(boxSize.copy().div(2));
  
  
  float outBoxDst = length(max(d,0));
  float inBoxDst = min(max(d),0);
  //println(outBoxDst, inBoxDst, max(d));
  //PVector size = boxSize.get().div(2);
  //float dX = max(c.x-size.x,0);
  //float dY = max(c.y-size.y,0);
  //float outBoxDst = le
  //float inBoxDst = max();
  return outBoxDst + inBoxDst;
}

float dstToCircle(PVector cameraOrigin, PVector circleCentre, float circleR){
  PVector Pos = circleCentre.copy().sub(cameraOrigin);
  float d = length(Pos) - circleR;
  return d;
}

float dstToLine(PVector cameraOrigin, PVector dot1, PVector dot2){
  PVector aToCamera = cameraOrigin.copy().sub(dot1);
  PVector bToCamera = cameraOrigin.copy().sub(dot2);
  PVector aToDot = dot2.copy().sub(dot1);
  PVector bToDot = dot1.copy().sub(dot2);
  float d = 0;
  if(aToCamera.dot(aToDot) <= 0){
    d = length(aToCamera);
  }else{
    if(bToCamera.dot(bToDot) <= 0){
      d = length(bToCamera);
    }else{
      float a = length(aToCamera);
      float b = length(bToCamera);
      float c = length(aToDot);
      float p = (a+b+c)/2;
      float S = sqrt(p*(p-a)*(p-b)*(p-c));
      d = (2*S)/length(aToDot);
    }
  }
  
  return d;
}

float getClosedDst(PVector Pos, Box boxes[], Circle circles[], Line lines[]){
  float d = 100000;
  for(int i = 0; i<boxes.length; i++){
    d = min(dstToBox(Pos, boxes[i].centre, boxes[i].size),d);
  }
  for(int i = 0; i<circles.length; i++){
    d = min(dstToCircle(Pos, circles[i].centre, circles[i].r),d);
  }
  for(int i = 0; i<lines.length; i++){
    d = min(dstToLine(Pos,lines[i].dot1,lines[i].dot2),d);
  }
  return d;
}

float getDstFromPosAndDir(PVector pos, PVector dir, Box boxes[], Circle circles[], Line lines[], int maxSteps, float dLim){
  PVector Pos = pos.copy();
  float totalDistance = 0;
    for(int i = 0; i<maxSteps; i++){
      float stepD = abs(getClosedDst(Pos, boxes, circles, lines));
      totalDistance += stepD;
      if(stepD <= dLim){
        break;
      }
      Pos.add(dir.copy().mult(stepD));
    }
  return totalDistance;
}
