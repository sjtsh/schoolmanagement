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
    int year = DateTime//getting current year
        .now()
        .year;

    //getting 12 months of the year
    for (int i = 0; i < 12; i++) {
      int month = i+1;
      int totalDays = getDaysInMonth(year, month);//calculating total days in the month
      int totalDaysInLastMonth = getDaysInMonth(year, month - 1);//calculating total days in the last month
      int weekday = DateTime(year, month, 1).weekday % 7;//calculating weekday of the first day of the month
      List<int> allDays = [];
      List<List<int>> returnableList = [[], [], [], [], [], []];
      for (int i = 0; i < weekday; i++) {
        allDays.add(totalDaysInLastMonth - i);//this is the days from the past month
      }
      allDays = allDays.reversed.toList();
      for (int i = 1; i <= totalDays; i++) {
        allDays.add(i);//these are the days from this month
      }
      int counter = 0;
      while (allDays.length != 42) {
        counter++;
        allDays.add(counter);//these are the days from next month
      }

      int a = 0;
      for (int i = 1; i <= allDays.length; i++) {
        returnableList[a].add(allDays[i - 1]);
        if (i % 7 == 0) {
          a++; //splitting all the days into weeks
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
      return Color(0xff797979); //if today has already found and the month is current month then grayish color
    }
    if (monthFinished) {
      return Colors.transparent; //if month has already been finished then transparent color
    }
    if ((i == DateTime
        .now()
        .day && month == DateTime
        .now()
        .month)) {
      return Color(0xffFFB525); //if the day is current then yellow color
    }

    if (checkInEvents(month, i)) {
      return Color(0xff5B75CF); //if the day is consisted among events then it returns blue color
    }
    if (checkInHolidays(month, i) ||
        DateTime(DateTime
            .now()
            .year, month, i).weekday == 6) {
      return Color(0xffCF5B5C); //if the day is saturday or the day is among the holidays then it returns red color
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
