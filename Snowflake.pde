//We generate some snowflakes
int k = 0;
int cycles = 0;
boolean flip = false;
int size = 200;
  RandomWalk bobby = new RandomWalk(size,12);

void draw(){
  //We oscillate the largeness of the snowflake; it is static now, since bobby just gets instantiated once at the setup
  if(k<size && !flip){
    k+=2;
  }
  else{
    flip = true;
    k-=2;
  }
  if(k==0){
    flip = false;
    bobby.makenewwalk();
    saveFrame("Snowflake-####.gif");
    cycles+=1;
    if(cycles>=2){
    noLoop();
    }
  }
  
   pushMatrix();
    clear();
  translate(width/2,height/2);
  for(int i = 1;i<=6; i++){
    if(i%2==0){
    bobby.weight = 3;
    }
    else{
      bobby.weight = 1;
      bobby.pathcolor = color(random(255),random(255),random(255));
    }
  rotate(PI/3);
  bobby.drawwalk(k);
  ellipse(bobby.path[2*k],bobby.path[2*k+1],4,4);
  }
    popMatrix();
    saveFrame("Snowflake-####.gif");
}
