import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Providers/Calendar.dart';
import 'package:schoolmanagement/Services/EventService.dart';

class AnnouncementTab extends StatelessWidget {
  const AnnouncementTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Recent Announcements",
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
        Expanded(
          child: FutureBuilder(
              future: EventService().getAnnouncements().then((value) {
                context.read<Calendar>().announcements = value;
                return 1;
              }),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: context
                        .read<Calendar>()
                        .announcements.reversed
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff404040),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "#NT${e.tutorID.toString().padLeft(3, "0")} - ${e.tutorName} at ${e.created.toString().substring(0, 19)}",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        e.description,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ],
    );
  }
}
