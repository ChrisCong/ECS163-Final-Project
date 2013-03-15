void setup() {
  int length = 0;
  ArrayList<String> categories = new ArrayList<String>();
  String[] videos;
  Table table;
  
  for (int i = 0; i < 4; i++) {
//    videos = loadStrings(i+".txt");
    table = loadTable(i+".txt", "tsv");
   length += table.getRowCount();//videos.length;
   println("rows "+table.getRowCount());//videos.length);
   
   for (int j = 0; j < table.getRowCount(); j++) {//videos.length; j++) {
      //if (categories.contains()categories.add
      if (j == 0) println(table.getColumnCount()+" "+table.getString(5, 1));//table.getColumnTitles());
      if (!categories.contains(table.getString(j, 3))) categories.add(table.getString(j,3));
   }
  }
  
  println("total "+length+" total categories "+categories.size());
  

}
