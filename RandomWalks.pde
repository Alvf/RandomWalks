//The goal: Generate a "copy/paste"-able random walk

class RandomWalk{
  //an integer array, containing all of the vertices, formatted from center (0,0)
  //to the end like [0,0,x_1,y_1,x_2,y_2,...,x_steps,y_steps]
  int[] path;
  //the color of the path
  color pathcolor = color(255,255,255);
  //the stroke of the path
  float weight = 1;
  
  //The work gets done here in actually generating our path; to actually draw it, we do a simple loop on line drawing
  //from the given integers in the path array
  
  public RandomWalk(int steps, float stepsize){
  int xc = 0;
  int yc = 0;
  
  int[] definedpath = new int[2*steps+2];
  
  definedpath[0] = xc;
  definedpath[1] = yc;
  
  for(int i = 1; i<=steps; i++){
    float dir = random(4);
    switch (floor(dir)){
      case 0: 
      yc+=stepsize;
      definedpath[2*i] = xc;
      definedpath[2*i+1] = yc;
      break;
      
      case 1: 
      yc-=stepsize;
      definedpath[2*i] = xc;
      definedpath[2*i+1] = yc;
      break;
      
      case 2: 
      xc+=stepsize;
      definedpath[2*i] = xc;
      definedpath[2*i+1] = yc;
      break;
      
      case 3: 
      xc-=stepsize;
      definedpath[2*i] = xc;
      definedpath[2*i+1] = yc;
      break;
      }
    }
    path = definedpath;
  }
  
  //draws the actual shape from the path's color and the path's weight
  public void drawwalk(){
    strokeWeight(weight);
    stroke(pathcolor);
    linepath(path);
  }
  
  private void linepath(int[] pathing){
    assert(pathing.length>=4 && pathing.length%2==0);
    for(int i = 0; i<=pathing.length/2-2; i++){
      line(pathing[2*i],pathing[2*i+1],pathing[2*i+2], pathing[2*i+3]);
    }
    
  }
}

void setup(){
 size(1800,900);
 background(0);
}
void draw(){
   pushMatrix();
     clear();
  translate(width/2,height/2);
  RandomWalk bobby = new RandomWalk(200,20);
  bobby.pathcolor = color(floor(random(255)),floor(random(255)),floor(random(255)));
  bobby.weight = 2;
  for(int i = 1;i<=6; i++){
  rotate(PI/3);
  bobby.drawwalk();
  }
    popMatrix();
}
