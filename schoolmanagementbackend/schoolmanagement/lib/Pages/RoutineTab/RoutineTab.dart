import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Models/Event.dart';
import 'package:schoolmanagement/Pages/RoutineTab/Schedule/ScheduleWidget.dart';
import 'package:schoolmanagement/Providers/Calendar.dart';
import 'package:schoolmanagement/Services/EventService.dart';
import 'package:schoolmanagement/Services/RoutineService.dart';

import '../../Models/Schedule.dart';
import '../../Providers/Routine.dart';
import '../../global.dart';

class RoutineTab extends StatelessWidget {
  int current = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff404040),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sudip's class routine",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  FutureBuilder(
                      future:
                          RoutineService().getRoutines(context).then((value) async {
                        context.read<RoutineManagement>().routines = value;
                        context.read<Calendar>().events =
                            await EventService().getEvents();
                        context.read<Calendar>().holidays =
                            await EventService().getHolidays();
                        return Future.value(0);
                      }),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                              children: context
                                  .read<RoutineManagement>()
                                  .getRoutine(context));
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      })
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Upcoming Exam's Schedule",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder(
              future: RoutineService().getExams(context).then((value) {
                context.read<RoutineManagement>().exams = value;
                return 1;
              }),
              builder: (_, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: context.watch<RoutineManagement>().exams.map((e) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xff404040),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff5B75CF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.day.day.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        months[e.day.month],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e.moduleName,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Text(
                                      "${e.startTime.hour.toString().padLeft(2, "0")}:${e.startTime.minute.toString().padLeft(2, "0")} - ${e.endTime.hour.toString().padLeft(2, "0")}:${e.startTime.minute.toString().padLeft(2, "0")}",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
