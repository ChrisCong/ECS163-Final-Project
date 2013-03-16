import java.text.*;
import java.util.*; 

YoutubeDay youtube_day;

void setup() {
  size(1100, 700); //1100 700
  smooth();
  
  Calendar day;
  ArrayList<String> files=new ArrayList<String>();
  
  day=getCalendar(3,27,2008);
  files.add(0, "032708-0.txt");
  files.add(1, "032708-1.txt");
  files.add(2, "032708-2.txt");
  files.add(3, "032708-3.txt");
  
  youtube_day=new YoutubeDay(day,files);
}

void draw() {
    background(0,220,120);
    
    Person p;
    for(int i=0;i<10;i++) {
      p = youtube_day.personList.get(i);
      p.setX(i*5);
      p.draw();
      p.move();
    }
}

