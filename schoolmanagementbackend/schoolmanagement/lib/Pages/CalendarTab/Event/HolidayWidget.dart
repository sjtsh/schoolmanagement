import 'package:flutter/material.dart';
import 'package:schoolmanagement/Models/Holiday.dart';

class HolidayWidget extends StatelessWidget {
  Holiday holiday;

  HolidayWidget(this.holiday);

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
                color: Color(0xffCF5B5C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Builder(builder: (context) {
                return Center(
                  child: Text(
                    holiday.date.day.toString(),
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
                Text(
                  holiday.title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
          ],
        ),
      ),
    );
  }
}
