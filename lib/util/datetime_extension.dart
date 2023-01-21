//get begining of the day in microseconds since epoch
extension DateTimeExtension on DateTime {
  int get beginningOfDay {
    return DateTime(year, month, day).millisecondsSinceEpoch;
  }
  int get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999, 999).millisecondsSinceEpoch;
  }
  String get shortString{
    return toString().split(" ")[1].split(".")[0];
  }

}

DateTime dateFromString(String s){
List<String> l = s.split("-");
if(l.length == 3){
return DateTime(int.parse(l[0]), int.parse(l[1]), int.parse(l[2]));
}else if (l.length == 2){
return DateTime(DateTime.now().year ,int.parse(l[0]), int.parse(l[1]));
}else{
return DateTime(DateTime.now().year,DateTime.now().month ,int.parse(l[0]));
}
}