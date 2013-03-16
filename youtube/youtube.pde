import java.text.*;
import java.util.*;

void setup() {
  size(800, 600);

  Calendar day;
  ArrayList<String> files = new ArrayList<String>();
  
  day = getCalendar(3, 1, 2007);
  files.add(0, "030107-0.txt");
  files.add(1, "030107-1.txt");
  files.add(2, "030107-2.txt");
  files.add(3, "030107-3.txt");

  YoutubeDay youtube_day = new YoutubeDay(day, files);
  
  /*for(int i=0; i<4;i++) {
*/
  for (int i=0;i<4;i++) {
    background(0,200,130);
    //persons[i].draw();
  }
}

