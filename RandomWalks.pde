//The goal: Generate a "copy/paste"-able random walk
//Apparently the setup function has to be in the file with the same name as the folder - oops
void setup(){
 size(1800,900);
 background(0);
}

class RandomWalk{
  //an integer array, containing all of the vertices, formatted from center (0,0)
  //to the end like [0,0,x_1,y_1,x_2,y_2,...,x_steps,y_steps]
  int[] path;
  //the color of the path
  color pathcolor = color(255,255,255);
  //the stroke of the path
  float weight = 1;
  //the actual amount of steps
  int steps = 1;
  //the size of the steps
  float stepsize = 20;
  
  //The work gets done here in actually generating our path; to actually draw it, we do a simple loop on line drawing
  //from the given integers in the path array
  
  public RandomWalk(int stepping, float stepsizing){
  
    steps = stepping;
    stepsize = stepsizing;
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
  //generates a new walk and sets it to the path
  public void makenewwalk(){
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
  
  //draws the actual shape from the path's color and the path's weight; draws out to the actual path's defined pathlength;
  public void drawwalk(){
    strokeWeight(weight);
    stroke(pathcolor);
    linepath(path);
  }
  
  //draws the shape, incomplete depending on how long we want to make the pathlength.
  public void drawwalk(int pathlength){
    strokeWeight(weight);
    stroke(pathcolor);
        for(int i = 0; i<=pathlength-1; i++){
      line(path[2*i],path[2*i+1],path[2*i+2], path[2*i+3]);
    }
  }
  
  private void linepath(int[] pathing){
    assert(pathing.length>=4 && pathing.length%2==0);
    for(int i = 0; i<=pathing.length/2-2; i++){
      line(pathing[2*i],pathing[2*i+1],pathing[2*i+2], pathing[2*i+3]);
    }
    
  }
}
