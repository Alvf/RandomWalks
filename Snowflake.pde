//We generate some snowflakes
int k = 1;
boolean flip = false;
int size = 200;
  RandomWalk bobby = new RandomWalk(size,20);

void draw(){
  //We oscillate the largeness of the snowflake; it is static now, since bobby just gets instantiated once at the setup
  if(k<size && !flip){
    k+=1;
  }
  else{
    flip = true;
    k-=1;
  }
  if(k==0){
    flip = false;
    bobby.makenewwalk();
    //saveFrame("Snowflake-####.png");
    //noLoop();
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
  ellipse(bobby.path[2*k],bobby.path[2*k+1],10,10);
  }
    popMatrix();
    //saveFrame("Snowflake-####.png");
}
