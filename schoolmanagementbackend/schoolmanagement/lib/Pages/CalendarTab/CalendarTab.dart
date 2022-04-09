import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Pages/ProfileScreen.dart';
import 'package:schoolmanagement/Providers/Calendar.dart';
import 'package:schoolmanagement/Services/EventService.dart';

import 'Event/EventWidget.dart';
import 'Event/HolidayWidget.dart';
import 'MyCalendar.dart';

class CalendarTab extends StatefulWidget {
  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1C1C1C),
        body: FutureBuilder(
            future: EventService().getHolidays().then((holidays) async {
              context.read<Calendar>().getCalendarView();
              context.read<Calendar>().events =
                  await EventService().getEvents();
              context.read<Calendar>().holidays = holidays;
              Future.delayed(Duration(milliseconds: 1000)).then((value) {
                context.read<Calendar>().pageController.animateToPage(
                    DateTime.now().month - 1,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn);
              });
              return 1;
            }),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Goodmorning Sudip!!!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return ProfileScreen();
                                }));
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff404040),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    MyCalendar(),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Upcoming events of the month",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Builder(builder: (context) {
                            return Container(
                              height: 500,
                              child: PageView(
                                physics: NeverScrollableScrollPhysics(),
                                controller:
                                    context.read<Calendar>().pageController2,
                                children:
                                    List.generate(12, (index) => index + 1)
                                        .map((e) {
                                  Map<DateTime, Widget> eventWidgets = {};
                                  context
                                      .read<Calendar>()
                                      .events
                                      .forEach((element) {
                                    if (element.date.month == e) {
                                      eventWidgets[element.date.add(Duration(
                                          hours: element.startTime.hour,
                                          minutes: element.startTime
                                              .minute))] = EventWidget(element);
                                    }
                                  });
                                  context
                                      .read<Calendar>()
                                      .holidays
                                      .forEach((element) {
                                    if (element.date.month == e) {
                                      eventWidgets[element.date] =
                                          HolidayWidget(element);
                                    }
                                  });
                                  return Column(
                                    children: eventWidgets.values.toList(),
                                  );
                                }).toList(),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
