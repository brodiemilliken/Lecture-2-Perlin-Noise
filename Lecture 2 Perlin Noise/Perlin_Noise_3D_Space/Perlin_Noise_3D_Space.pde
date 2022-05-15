
float xRot = 0;
float yRot = 0;
float zRot = 0;
float zoom = 2;
boolean xUp, xDown, yUp, yDown, zUp, zDown;
float[][][] positions;
int w = 10;


void setup(){
  fullScreen(P3D);
  positions = new float[w][w][w];
  for (int x = 0; x < w; x++){
    for (int y = 0; y < w; y++) {
      for (int z = 0; z < w; z++) {
        positions[x][y][z] = noise(x/5.0,y/5.0,z/5.0);
      }
    }
  }
}

void draw(){
  background(0);
  fill(255);
  noStroke();
  push();
  translate(width/2,height/2,-zoom);
  rotateX(-xRot);
  rotateY(-yRot);
  rotateZ(-zRot);
  
  colorMode(HSB);
  for (int x = 0; x < w; x++){
    for (int y = 0; y < w; y++) {
      for (int z = 0; z < w; z++) {
        push();
        translate(x*10-5*w,y*10-5*w,z*10);
        fill(map(positions[x][y][z],0,1,0,255),255,255,100);
        sphere(positions[x][y][z]*5);
        pop();
      }
    }
  }
  
  
  pop();
  rotateX(xRot);
  rotateY(yRot);
  rotateZ(zRot);
  rot();
}

void rot(){
  if (xUp) xRot += PI/30;
  if (xDown) xRot -= PI/30;
  if (zUp) zRot += PI/30;
  if (zDown) zRot -= PI/30;
  if (yUp) yRot += PI/30;
  if (yDown) yRot -= PI/30;
}

void keyPressed(){
  if(keyCode == RIGHT) yUp = true;
  if(keyCode == LEFT) yDown = true;
  if(keyCode == UP) xUp = true;
  if(keyCode == DOWN) xDown = true;
  if(key == 'p') zUp = true;
  if(key == 'o') zDown = true;
}

void keyReleased(){
  if(keyCode == RIGHT) yUp = false;
  if(keyCode == LEFT) yDown = false;
  if(keyCode == UP) xUp = false;
  if(keyCode == DOWN) xDown = false;
  if(key == 'p') zUp = false;
  if(key == 'o') zDown = false;  
}

void mouseWheel(MouseEvent event){
  zoom += event.getCount() * 10;
}
