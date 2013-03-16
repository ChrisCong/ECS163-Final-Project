class YoutubeDay {
   Calendar day;
   ArrayList<Person> personList;
   HashMap<String, Person> personMap;
   ArrayList<String> categoryList;
  
    YoutubeDay(Calendar day, ArrayList<String> files) {
      this.day = day;
      Table table;
      Person person;
      personList = new ArrayList<Person>();
      personMap = new HashMap<String, Person>();
      categoryList = new ArrayList<String>();
      
      for (int i = 0; i < files.size(); i++) {
        table = loadTable(files.get(i), "tsv");  
        
        for (int j = 0; j < table.getRowCount(); j++) {
            person = new Person();
            if (!categoryList.contains(table.getString(j, 3)))
                categoryList.add(table.getString(j, 3));
            
            person.videoId = table.getString(j, 0);
            person.uploader = table.getString(j, 1);
            person.category = table.getString(j, 3);
            person.comments = table.getString(j, 8);
            person.relatedId = table.getString(j, 9);
           
            if (table.getString(j, 6) != null) person.rating = Float.parseFloat(table.getString(j, 6));
            
            try {
              person.age = Integer.parseInt(table.getString(j, 2));
            } catch (NumberFormatException e) {
               //System.err.println(person.videoId+" incorrect age: "+e); 
              person.age = 0;
            }
            try {
              person.vidLength = Integer.parseInt(table.getString(j, 4));
            } catch (NumberFormatException e) {
              person.vidLength = 0;
            }
            try {
              person.views = Integer.parseInt(table.getString(j, 5));
            } catch (NumberFormatException e) {
              person.views = 0;
            }
            try {
              person.num_ratings = Integer.parseInt(table.getString(j, 7));
            } catch (NumberFormatException e) {
              person.num_ratings = 0;
            }
          
            personList.add(person);
            personMap.put(person.videoId, person);
        }
      }
      
    }
    
    void printPerson(int index) {
        Person person = personList.get(index);
        
        println("VideoID: "+person.videoId);
        println("uploader: "+person.uploader);
        println("age: "+person.age);
        println("category: "+person.category);
        println("length: "+person.vidLength);
        println("views: "+person.views);
        println("rating: "+person.rating);
        println("num_ratings: "+person.num_ratings);
        println("comments: "+person.comments);
        println("relatedIds: "+person.relatedId);
        println();
    }
    
    void printPerson(String id) {
       Person person = personMap.get(id); 
       
        println("VideoID: "+person.videoId);
        println("uploader: "+person.uploader);
        println("age: "+person.age);
        println("category: "+person.category);
        println("length: "+person.vidLength);
        println("views: "+person.views);
        println("rating: "+person.rating);
        println("num_ratings: "+person.num_ratings);
        println("comments: "+person.comments);
        println("relatedIds: "+person.relatedId);
        println();
    }
};
