float t; //new variable instantiated

void setup(){
  size(600,600);
  t = 0; //set t to be equal to any value. 0 is just easier
}

void draw(){
  background(0);
  
  stroke(255);
  strokeWeight(5);
  
  noFill();
  beginShape(); //Starts a shape that you can add verticies to
  
  //For loop going across every pixel of the screen
    //Use the x value as our horizontal position
  for (int x = 0; x < width; x++){ 
    //Set our height value to the noise that occurs at the x position
    
    //Add our second argument to the noise function
    float y = noise(x/50.0, t) * 100 + height/2; 
    //Create a new vertex for our shape at x, y
    vertex(x,y); 
  }
  //Ends the shape
  endShape();
  
  //Increment t over time
  t += 0.05;
}
