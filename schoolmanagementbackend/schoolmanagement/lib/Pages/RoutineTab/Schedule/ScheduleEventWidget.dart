import 'package:flutter/material.dart';
import 'package:schoolmanagement/Models/Schedule.dart';
import 'package:schoolmanagement/global.dart';

import '../../../Models/Event.dart';

class ScheduleEventWidget extends StatelessWidget {
  final Event e;

  ScheduleEventWidget(this.e);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xff5B75CF),
                borderRadius: BorderRadius.circular(6)),
            child: Row(children: [
              SizedBox(
                width: 50,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: e.date.day != DateTime.now().weekday
                                ? Colors.transparent
                                : Color(0xffFFB525),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              weekdays[
                                  e.date.weekday == 7 ? 0 : e.date.weekday],
                              style: TextStyle(
                                  color: e.date.day != DateTime.now().weekday
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Text(
                  e.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ])));
  }
}
