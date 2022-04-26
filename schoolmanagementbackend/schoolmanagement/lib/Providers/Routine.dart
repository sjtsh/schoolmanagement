import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Models/Holiday.dart';
import 'package:schoolmanagement/Pages/RoutineTab/Schedule/ScheduleEventWidget.dart';
import 'package:schoolmanagement/Pages/RoutineTab/Schedule/ScheduleHolidayWidget.dart';
import 'package:schoolmanagement/Pages/RoutineTab/Schedule/ScheduleWidget.dart';

import '../Models/Event.dart';
import '../Models/Exam.dart';
import '../Models/Schedule.dart';
import '../Models/User.dart';
import 'Calendar.dart';

class RoutineManagement with ChangeNotifier, DiagnosticableTreeMixin {
  List<Routine> routines = [];
  List<Exam> exams = [];
  int getActualWeekDay(int techWeekday) {
    if (techWeekday == 7) {
      return 0;
    }
    return techWeekday;
  }

  Map<String, Widget> getSchedule() {
    Map<String, Widget> widgetMap = {};
    int currentWeekday = getActualWeekDay(
        DateTime.now().weekday); //1 for monday, 7 for sunday, 6 for saturday

    //iterates for for days before the current date
    for (int i = 0; i <= currentWeekday; i++) {
      DateTime date = DateTime.now().subtract(Duration(days: i)); //date for each iteration
      int tempWeekday = getActualWeekDay(date.weekday); //getting the weekday for the date
      if(tempWeekday!=6){
        widgetMap[date.toString().substring(0, 10)] = ScheduleWidget(
            routines.firstWhere((element) => tempWeekday == element.day - 1)); //creating a ui widget for that date
      }
    }

    //iterates for for days after the current date
    for (int i = 0; i <= 7 - currentWeekday - 2; i++) {
      DateTime date = DateTime.now().add(Duration(days: i)); //date for the iteration
      int tempWeekday = getActualWeekDay(date.weekday); //getting the week day for the date
      widgetMap[date.toString().substring(0, 10)] = ScheduleWidget(
          routines.firstWhere((element) => tempWeekday == element.day - 1)); //creating a ui widget for that date
    }
    return widgetMap;
  }

  List<Widget> getRoutine(BuildContext context) {
    Map<String, Widget> widgetMap = getSchedule();  //gets the schedule

    //overrides all of the holidays
    for (Holiday i in context.read<Calendar>().holidays) {
      if (widgetMap.containsKey(i.date.toString().substring(0, 10))) { //if the list of holidays contains a key
        widgetMap[i.date.toString().substring(0, 10)] =
            ScheduleHolidayWidget(i);
      }
    }

    //overrides all of the events
    for (Event i in context.read<Calendar>().events) {
      if (widgetMap.containsKey(i.date.toString().substring(0, 10))) { //if the list of events contains a key
        widgetMap[i.date.toString().substring(0, 10)] = ScheduleEventWidget(i);
      }
    }

    //returns the map along with saturday which is the weekend
    return [
      ...widgetMap.values.toList().reversed.toList(),
      ScheduleHolidayWidget(
          Holiday("Weekend", "Saturday", DateTime(2022, 4, 9)))
    ];
  }
}
