//We generate some snowflakes


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
