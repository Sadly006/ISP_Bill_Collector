
String nameShortener(String first, String last){
  String full = first + " " + last;
  if(full.length>22){
    return full.replaceRange(16, full.length, "...");
  }
  else{
    return full;
  }
}