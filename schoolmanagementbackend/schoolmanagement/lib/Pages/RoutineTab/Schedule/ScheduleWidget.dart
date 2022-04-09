import 'package:flutter/material.dart';
import 'package:schoolmanagement/Models/Schedule.dart';
import 'package:schoolmanagement/global.dart';

class ScheduleWidget extends StatelessWidget {
  final Routine e;

  ScheduleWidget(this.e);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(children: [
            SizedBox(
              width: 50,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: e.day !=
                                  (DateTime.now().weekday == 7
                                          ? 0
                                          : DateTime.now().weekday) +
                                      1
                              ? Colors.transparent
                              : Color(0xffFFB525),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            weekdays[e.day - 1],
                            style: TextStyle(
                                color: e.day !=
                                        (DateTime.now().weekday == 7
                                                ? 0
                                                : DateTime.now().weekday) +
                                            1
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
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${e.startTime.hour.toString().padLeft(2, "0")}:${e.startTime.minute.toString().padLeft(2, "0")} - ${e.endTime.hour.toString().padLeft(2, "0")}:${e.endTime.minute.toString().padLeft(2, "0")}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    e.meetLink != null
                        ? Container(
                            decoration: BoxDecoration(
                              color: Color(0xff016f11),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 6),
                              child: Text(
                                "Launch meet",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        : Container(),
                    e.remarks != null
                        ? Container(
                            decoration: BoxDecoration(
                              color: Color(0xffa0171b),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 6),
                              child: Text(
                                e.remarks!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                Text(
                  e.moduleName,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ))
          ]),
        ));
  }
}
