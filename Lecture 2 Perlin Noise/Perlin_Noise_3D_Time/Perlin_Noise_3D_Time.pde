float z;
void setup(){
  size(600,600);
  z = 0;
}

void draw(){
  background(0);
  noStroke();
  for (int i = 0; i < width; i+=5){
    for (int j = 0; j < height; j+=5){
      fill(map(noise(i/100.0,j/100.0, z),0,1,0,255));
      rect(i,j,5,5);
    }
  }
  z+=0.005;
}
