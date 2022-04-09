import 'Models/User.dart';

List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];
List<String> weekdays = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
String localhost = "http://192.168.1.68:8000";

User? meUser;

String getPosition(int i){
  String prefix = i.toString();
  String suffix = "th";
  int remainder = i%10;
  if(remainder == 2){
    suffix = "nd";
  }else if(remainder == 3){
    suffix = "rd";
  }
  return prefix+suffix;
}