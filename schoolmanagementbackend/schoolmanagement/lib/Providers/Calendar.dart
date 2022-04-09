import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagement/Models/Announcement.dart';
import 'package:schoolmanagement/Models/Event.dart';

import '../Models/Holiday.dart';

class Calendar with ChangeNotifier, DiagnosticableTreeMixin {
  int today = DateTime
      .now()
      .day;
  int _currentCalendarMonth = DateTime
      .now()
      .month;
  PageController pageController = PageController();
  PageController pageController2 = PageController();
  List<Holiday> holidays = [];
  List<Announcement> announcements = [];
  List<Event> events = [];

  List<List<List<int>>> calendars = [];

  int get currentCalendarMonth => _currentCalendarMonth;

  set currentCalendarMonth(int value) {
    _currentCalendarMonth = value;
    notifyListeners();
  }

  void getCalendarView() {
    int year = DateTime
        .now()
        .year;
    for (int i = 0; i < 12; i++) {
      int month = i+1;
      int totalDays = getDaysInMonth(year, month);
      int totalDaysInLastMonth = getDaysInMonth(year, month - 1);
      int weekday = DateTime(year, month, 1).weekday % 7;
      List<int> allDays = [];
      List<List<int>> returnableList = [[], [], [], [], [], []];
      for (int i = 0; i < weekday; i++) {
        allDays.add(totalDaysInLastMonth - i);
      }
      allDays = allDays.reversed.toList();
      for (int i = 1; i <= totalDays; i++) {
        allDays.add(i);
      }
      int counter = 0;
      while (allDays.length != 42) {
        counter++;
        allDays.add(counter);
      }

      int a = 0;
      for (int i = 1; i <= allDays.length; i++) {
        returnableList[a].add(allDays[i - 1]);
        if (i % 7 == 0) {
          a++;
        }
      }
      calendars.add(returnableList);
    }
  }

  // sunday == 7
  // saturday == 6
  Color getBackgroundColor(int i, bool todayFound, bool monthFinished,
      int month) {
    if (!todayFound && month == DateTime
        .now()
        .month) {
      return Color(0xff797979);
    }
    if (monthFinished) {
      return Colors.transparent;
    }
    if ((i == DateTime
        .now()
        .day && month == DateTime
        .now()
        .month)) {
      return Color(0xffFFB525);
    }

    if (checkInEvents(month, i)) {
      return Color(0xff5B75CF);
    }
    if (checkInHolidays(month, i) ||
        DateTime(DateTime
            .now()
            .year, month, i).weekday == 6) {
      return Color(0xffCF5B5C);
    }
    return Colors.transparent;
  }

  Color getTextColor(int i, bool todayFound, bool monthFinished, int month) {
    if ((i == DateTime
        .now()
        .day && month == DateTime
        .now()
        .month)) {
      return Color(0xff404040);
    }
    if ((monthFinished || !todayFound)) {
      return Colors.white.withOpacity(0.5);
    }
    return Colors.white;
  }

  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  bool checkInHolidays(int month, int day) {
    for (var element in holidays) {
      if (element.date.day == day && element.date.month == month) {
        return true;
      }
    }
    return false;
  }

  bool checkInEvents(int month, int day) {
    for (var element in events) {
      if (element.date.day == day && element.date.month == month) {
        return true;
      }
    }
    return false;
  }
}
