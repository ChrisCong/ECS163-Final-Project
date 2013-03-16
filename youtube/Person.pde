class Person {
  float x, y, w, h, rX, rX2, rX3, rY, rY2, rY3, rW, rW2, rW3, rH, rH2, rH3, rating; 
  int age, vidLength, views, num_ratings;
  String videoId, category, comments, relatedId, uploader;
  float tX, tX2, tX3, tY, tY2, tY3, factor, movetX, movetY;
  float lx, ly, lx2, ly2;
  
  Person(float x, float y, float w, float h, String videoId, String uploader, int age, String category, int vidLength, int views, float rating, String comments) {
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
  }
  
  Person() {}

  void draw() {
    fill(255); noStroke();
    x=350; y=150; w=220; h=220; //ellipse
    rX=274; rY=300; rW=149; rH=180; //shirt 
    rX2=50; rY2=400; rW2=20; rH2=80; //leg1
    rX3=200; rY3=400; rW3=20; rH3=80; //leg2
    tX=30; tY=75; tX2=58; tY2=20; tX3=86; tY3=75;
    lx=rX; ly=rY+57; lx2=rX+25; ly2=rY;
    
    factor=4.5; movetX=85; movetY=20;
    stroke(0); strokeWeight(2);
    triangle(220+20,495,348,45,476-20,495); //part of leg+body
    //fill(255,0,0);
    triangle(tX*factor+movetX, tY*factor+movetY, tX2*factor+movetX, tY2*factor+movetY, tX3*factor+movetX, tY3*factor+movetY); //shirt
    fill(255);
    ellipse(x, y, w, h); //face
    noStroke();
    rect(rX,rY,rW,rH); //part of legs+shirt
    stroke(0);
    line(lx, ly, lx2, ly2); line(rX+rW, ly, rX+rW-25, ly2); //shirt
    line(rX+75.5, rY+130, rX+75.5, rY+rH+13); //legs
    fill(0);
    ellipse(x-40,y,10,20); ellipse(x+40,y,10,20);
  }
}

