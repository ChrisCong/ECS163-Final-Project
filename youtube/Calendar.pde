public Calendar getCalendar(int day, int month, int year) {
   Calendar date = Calendar.getInstance();
   date.set(Calendar.YEAR, year);
   date.set(Calendar.MONTH, month);
   date.set(Calendar.DAY_OF_MONTH, day);
   
   return date;
}
