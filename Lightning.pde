void setup()
{
  size(300,300);
  noLoop();
}

void draw()
{
  background(200,200,200);
  noStroke();
  //water
  fill(175,220,240,20);
  for(int i = 1; i<20; i++){
    rect(0,300-5*i,300,300);
  }
  //tree
  for(int i = 0; i<(int)(Math.random()*5)+1; i++){
    int farness = (int)((Math.random()-.5)*50);
    tree(150+((int)((Math.random()-.5)*200)),250+farness,0,abs(farness)+30,false);
  }
}

void mousePressed()
{
  redraw();
}

void tree(int startX,int startY,int branch,int size, boolean split){
  int endX;
  int endY;
  float rnd;
  //main
  if(branch<10){
    strokeWeight(10-branch);
    stroke((int)(Math.random()*4*branch)+200,(int)(Math.random()*4*branch)+200,(int)(Math.random()*4*branch)+200);
    rnd = (float)(Math.random()-0.5);
    endX = startX+(int)((rnd/abs(rnd))*((Math.random()*4*branch)+5));
    endY = startY-(int)(((Math.random())*size)+5);
    line(startX,startY,endX,endY);
    branch+=1;
    tree(endX,endY,branch,size,false);
  }
  //split
  if(branch<10 && branch>1 && Math.random() > 0.6 && split == false){
    strokeWeight(10-branch);
    stroke((int)(Math.random()*4*branch)+200,(int)(Math.random()*4*branch)+200,(int)(Math.random()*4*branch)+200);
    rnd = (float)(Math.random()-0.5);
    endX = startX+(int)((rnd/abs(rnd))*((Math.random()*4*branch)+5));
    endY = startY-(int)(((Math.random())*size)+5);
    line(startX,startY,endX,endY);
    tree(endX,endY,branch,size,true);
  }
}
