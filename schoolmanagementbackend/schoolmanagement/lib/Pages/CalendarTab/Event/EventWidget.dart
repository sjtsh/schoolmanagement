import 'package:flutter/material.dart';
import 'package:schoolmanagement/Models/Event.dart';

class EventWidget extends StatelessWidget {
  Event event;

  EventWidget(this.event);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xff404040),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xff5B75CF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Builder(builder: (context) {
                return Center(
                  child: Text(
                    event.date.day.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "${event.startTime.hour.toString().padLeft(2, "0")}:${event.startTime.minute.toString().padLeft(2, "0")} - ${event.endTime.hour.toString().padLeft(2, "0")}:${event.endTime.minute.toString().padLeft(2, "0")}",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
