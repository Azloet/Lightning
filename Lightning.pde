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
    tree(150+((int)((Math.random()-.5)*200)),250+farness,0,abs(farness)+30);
  }
}

void mousePressed()
{
  redraw();
}

void tree(int startX,int startY,int branch,int size){
  int endX;
  int endY;
  //main
  if(branch<10){
    strokeWeight(10-branch);
    stroke((int)(Math.random()*branch)+247,(int)(Math.random()*branch)+247,(int)(Math.random()*branch)+247);
    endX = startX+(int)((Math.random()-0.5)*2*size/sqrt(10-branch));
    endY = startY-(int)((Math.random())*size);
    line(startX,startY,endX,endY);
    branch+=1;
    tree(endX,endY,branch,size);
    //if(branch == 10){
    //  lightning(endX,endY);
    //}
  }
  //split
  if(branch<10 && branch>1 && Math.random()>.5){
    strokeWeight(10-branch);
    stroke((int)(Math.random()*branch)+247,(int)(Math.random()*branch)+247,(int)(Math.random()*branch)+247);
    endX = startX+(int)((Math.random()-0.5)*2*size/sqrt(10-branch));
    endY = startY-(int)((Math.random())*size);
    line(startX,startY,endX,endY);
    tree(endX,endY,branch,size);
  }
}

void lightning(int startX,int startY){
  int endX = startX;
  int endY = startY;
  strokeWeight(1);
  stroke(255,255,100);
  
  while(endY>=0){
    endX = startX + (int)((Math.random()-0.5)*20);
    endY = startY - (int)(Math.random()*10);
    line(startX,startY,endX,endY);
    startX = endX;
    startY = endY;
  }
}
