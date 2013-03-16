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
            //person = new Person();
            if (!categoryList.contains(table.getString(j, 3)))
                categoryList.add(table.getString(j, 3));
                
            String videoId = table.getString(j, 0);
            String uploader = table.getString(j, 1);
            String category = table.getString(j, 3);
            //String comments = table.getString(j, 8);
            String relatedId = table.getString(j, 9);
            int age, vidLength, views, num_ratings, comments;
            float rating;
           
            if (table.getString(j, 6) != null) rating = Float.parseFloat(table.getString(j, 6));
            else rating = 0;
            
            try {
              age = Integer.parseInt(table.getString(j, 2));
            } catch (NumberFormatException e) {
               //System.err.println(person.videoId+" incorrect age: "+e);
              age = 0;
            }
            try {
              vidLength = Integer.parseInt(table.getString(j, 4));
            } catch (NumberFormatException e) {
              vidLength = 0;
            }
            try {
              views = Integer.parseInt(table.getString(j, 5));
            } catch (NumberFormatException e) {
              views = 0;
            }
            try {
              num_ratings = Integer.parseInt(table.getString(j, 7));
            } catch (NumberFormatException e) {
              num_ratings = 0;
            }
            try {
              comments= Integer.parseInt(table.getString(j, 8));
            } catch (NumberFormatException e) {
              comments=0;
            }
            person=new Person(0, 0, 0, 0, videoId, uploader, age, category, vidLength, views, rating, num_ratings, comments);
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
