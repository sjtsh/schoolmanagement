import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/Calendar.dart';
import '../../global.dart';

class MyCalendar extends StatelessWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130 + 6 * 52,
      child: PageView(
        onPageChanged: (int i) {
          context.read<Calendar>().currentCalendarMonth = i;
          context.read<Calendar>().pageController2.animateToPage(i, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        controller: context.read<Calendar>().pageController,
        children: List.generate(12, (index) => index + 1)
            .map(
              (index) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff404040),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 6.0, vertical: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0),
                      child: Container(
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            Expanded(child: Container()),
                            Text(
                              months[index - 1],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        "Su",
                        "Mo",
                        "Tu",
                        "We",
                        "Th",
                        "Fr",
                        "Sa"
                      ]
                          .map(
                            (e) => Expanded(
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Builder(builder: (context) {
                      bool todayFound = false;
                      bool monthFinished = false;
                      return Column(
                        children: context
                            .read<Calendar>()
                            .calendars[index - 1]
                            .map(
                              (e) {
                            return Row(
                              children: e
                                  .asMap()
                                  .entries
                                  .map((f) {
                                if (f.value ==
                                    DateTime.now().day) {
                                  todayFound = true;
                                }
                                if (todayFound &&
                                    f.value == 1) {
                                  monthFinished = true;
                                }
                                if (index !=
                                    DateTime.now()
                                        .month &&
                                    f.value == 1) {
                                  todayFound = true;
                                }
                                return Expanded(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets
                                        .all(6.0),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: context
                                              .read<
                                              Calendar>()
                                              .getBackgroundColor(
                                              f.value,
                                              todayFound,
                                              monthFinished,
                                              index),
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              6)),
                                      child: Center(
                                        child: Text(
                                          f.value
                                              .toString(),
                                          style: TextStyle(
                                            color: context
                                                .read<
                                                Calendar>()
                                                .getTextColor(
                                                f.value,
                                                todayFound,
                                                monthFinished,
                                                index),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ).toList(),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
