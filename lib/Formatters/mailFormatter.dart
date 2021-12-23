
String mailShortener(String mail){
  if(mail.length>22){
    return mail.replaceRange(16, mail.length, "...");
  }
  else{
    return mail;
  }
}