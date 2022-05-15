void setup(){
  size(950,200);
}

void draw(){
  background(0);
  
  ////Random Values
  noFill();
  stroke(255);
  beginShape();
  for (int i = 0; i < width; i++)
  {
    vertex(i,random(-25,25) + 50);
  }
  endShape();
  
  //Noise Values
  beginShape();
  for (int i = 0; i < width; i++)
  {
    vertex(i,map(noise(i/100.0),0,1,-25,25) + 150);
  }
  endShape();
  noLoop();
}
