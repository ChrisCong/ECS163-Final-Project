class Person {
  float x, y, w, h, rX, rX2, rX3, rY, rY2, rY3, rW, rW2, rW3, rH, rH2, rH3, rating; 
  int age, vidLength, views, comments, num_ratings;
  String videoId, category, relatedId, uploader;
  float tX, tX2, tX3, tY, tY2, tY3, factor, movetX, movetY;
  float eX,eY,eW,eH;
  float lx, ly, lx2, ly2;
  float moveObjX, moveObjY;
  
  Person() {}
  Person(float x, float y, float w, float h, String videoId, String uploader, int age, String category, int vidLength, int views, float rating, int num_ratings, int comments) {
    this.x=x; 
    this.y=y; 
    this.w=w; 
    this.h=h; 
    this.videoId=videoId; 
    this.uploader=uploader; 
    this.age=age;
    this.category=category; 
    this.vidLength=vidLength; 
    this.views=views; 
    this.rating=rating; 
    this.comments=comments; 
   
    eX=350; eY=150; eW=220; eH=220; //ellipse
    rX=274; rY=300; rW=149; rH=180; //shirt 
    rX2=50; rY2=400; rW2=20; rH2=80; //leg1
    rX3=200; rY3=400; rW3=20; rH3=80; //leg2
    tX=30; tY=75; tX2=58; tY2=25; tX3=86; tY3=75;
    lx=rX; ly=rY+57; lx2=rX+25; ly2=rY;
    factor=4; movetX=85; movetY=20;
  }

  void setX(float x) {this.x=x; }
  void setY(float y) {this.y=y; }

  void draw() {
    drawPerson();
  }
  
  void move() {
    moveObjX+=int(random(-5,5));
    if((eX/factor+moveObjX) > 150)
     moveObjY+=int(random(-1,2)); 
    if((eX/factor+moveObjX) < 50 || (eX/factor+moveObjX) > 750) 
      moveObjX-=moveObjX;
    if((eX/factor+moveObjY) > 500)
      moveObjY-=moveObjY;
  }
  void drawPerson() {
    fill(255); stroke(0); strokeWeight(2);
    triangle(x+240/factor+moveObjX,495/factor+moveObjY,x+348/factor+moveObjX,55/factor+moveObjY,x+456/factor+moveObjX,495/factor+moveObjY); //part of leg+body
    fill(255,0,0);
    triangle(x+(tX*4.5+movetX)/factor+moveObjX, (tY*4.5+movetY)/factor+moveObjY, x+(tX2*4.5+movetX)/factor+moveObjX, (tY2*4.5+movetY)/factor+moveObjY, x+(tX3*4.5+movetX)/factor+moveObjX, (tY3*4.5+movetY)/factor+moveObjY); //shirt
    //noStroke(); fill(255); rect(rX,rY,rW,rH); //part of legs+shirt
    fill(255,0,0);
    triangle(x+259/factor+moveObjX,395/factor+moveObjY,x+350/factor+moveObjX,155/factor+moveObjY,x+438/factor+moveObjX,395/factor+moveObjY);
    noStroke(); //fill in shirt
    rect(x+rX/factor+moveObjX,(rY-24)/factor+moveObjY,(rW+2)/factor,(rH-100)/factor); 
    rect(x+(rX+8)/factor+moveObjX,(rY-50)/factor+moveObjY,(rW-21)/factor,(rH-100)/factor);
    fill(255); stroke(0);
    ellipse(x+eX/factor+moveObjX, eY/factor+moveObjY, eW/factor, eH/factor); //face 
    line(x+lx/factor+moveObjX, ly/factor+moveObjY, x+lx2/factor+moveObjX, ly2/factor+moveObjY); line(x+(rX+rW)/factor+moveObjX, ly/factor+moveObjY, x+(rX+rW-25)/factor+moveObjX, ly2/factor+moveObjY); //shirt
    line(x+(rX+75.5)/factor+moveObjX, (rY+130)/factor+moveObjY, x+(rX+75.5)/factor+moveObjX, (rY+rH+13)/factor+moveObjY); //legs
    fill(0);
    ellipse(x+(eX-40)/factor+moveObjX,eY/factor+moveObjY,10/factor,20/factor); ellipse(x+(eX+40)/factor+moveObjX,eY/factor+moveObjY,10/factor,20/factor); //eyes
   
   //smiley faces = ratings
    fill(255);
    if(rating > 4.5) { //smile + open mouth
      line(x+(eX-30)/factor+moveObjX,(eY+59)/factor+moveObjY,x+(eX+30)/factor+moveObjX,(eY+59)/factor+moveObjY);
      curve(x+(eX-100)/factor+moveObjX, (eY-25)/factor+moveObjY, x+(eX-30)/factor+moveObjX, (eY+60)/factor+moveObjY, x+(eX+30)/factor+moveObjX, (eY+60)/factor+moveObjY, x+(eX+100)/factor+moveObjX, (eY-25)/factor+moveObjY);
    }
    else if(rating > 3.8 && rating <= 4.5) // smile
      curve(x+(eX-100)/factor+moveObjX, (eY-25)/factor+moveObjY, x+(eX-30)/factor+moveObjX, (eY+60)/factor+moveObjY, x+(eX+30)/factor+moveObjX, (eY+60)/factor+moveObjY, x+(eX+100)/factor+moveObjX, (eY-25)/factor+moveObjY);
    else if(rating > 3.5 && rating <= 3.8) //smile neutral
      curve(x+(eX-100)/factor+moveObjX, 50/factor+moveObjY,x+(eX-30)/factor+moveObjX,(eY+50)/factor+moveObjY,x+(eX+30)/factor+moveObjX,(eY+50)/factor+moveObjY,x+(eX+100)/factor+moveObjX,200/factor+moveObjY);
    else if(rating >= 2.5 && rating <= 3.5) //neutral
      line(x+(eX-30)/factor+moveObjX,(eY+59)/factor+moveObjY,x+(eX+30)/factor+moveObjX,(eY+59)/factor+moveObjY);
    else if(rating >= 2.2 && rating < 2.5) //frown neutral
      curve(x+(eX-100)/factor+moveObjX,400/factor+moveObjY,x+(eX-30)/factor+moveObjX,(eY+50)/factor+moveObjY,x+(eX+30)/factor+moveObjX,(eY+50)/factor+moveObjY,x+(eX+100)/factor+moveObjX,180/factor+moveObjY);
    //curve((eX-100),300/factor+moveObjY,(eX-30)/factor+moveObjX,(eY+50)/factor+moveObjY,(eX+30)/factor+moveObjX,(eY+50)/factor+moveObjY,(eX+100)/factor+moveObjX,100/factor+moveObjY);
    else if(rating < 2.2 && rating >= 1.5) //frown
      curve(x+(eX-100)/factor+moveObjX,260/factor+moveObjY,x+(eX-30)/factor+moveObjX,(eY+60)/factor+moveObjY,x+(eX+30)/factor+moveObjX,(eY+60)/factor+moveObjY,x+(eX+100)/factor+moveObjX,260/factor+moveObjY); 
    else if(rating < 1.5) { //frown + open mouth
      line(x+(eX-30)/factor+moveObjX,(eY+60)/factor+moveObjY,x+(eX+30)/factor+moveObjX,(eY+60)/factor+moveObjY);
      curve(x+(eX-100)/factor+moveObjX,300/factor+moveObjY,x+(eX-30)/factor+moveObjX,(eY+60)/factor+moveObjY,x+(eX+30)/factor+moveObjX,(eY+60)/factor+moveObjY,x+(eX+100)/factor+moveObjX,300/factor+moveObjY); 
    }
  }
}

