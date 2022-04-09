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
    for (int i = 0; i <= currentWeekday; i++) {
      DateTime date = DateTime.now().subtract(Duration(days: i));
      int tempWeekday = getActualWeekDay(date.weekday);
      if(tempWeekday!=6){
        widgetMap[date.toString().substring(0, 10)] = ScheduleWidget(
            routines.firstWhere((element) => tempWeekday == element.day - 1));
      }
    }
    for (int i = 0; i <= 7 - currentWeekday - 2; i++) {
      DateTime date = DateTime.now().add(Duration(days: i));
      int tempWeekday = getActualWeekDay(date.weekday);
      widgetMap[date.toString().substring(0, 10)] = ScheduleWidget(
          routines.firstWhere((element) => tempWeekday == element.day - 1));
    }
    return widgetMap;
  }

  List<Widget> getRoutine(BuildContext context) {
    Map<String, Widget> widgetMap = getSchedule();
    for (Holiday i in context.read<Calendar>().holidays) {
      if (widgetMap.containsKey(i.date.toString().substring(0, 10))) {
        widgetMap[i.date.toString().substring(0, 10)] =
            ScheduleHolidayWidget(i);
      }
    }
    for (Event i in context.read<Calendar>().events) {
      if (widgetMap.containsKey(i.date.toString().substring(0, 10))) {
        widgetMap[i.date.toString().substring(0, 10)] = ScheduleEventWidget(i);
      }
    }
    return [
      ...widgetMap.values.toList().reversed.toList(),
      ScheduleHolidayWidget(
          Holiday("Weekend", "Saturday", DateTime(2022, 4, 9)))
    ];
  }
}
