import 'dart:convert';

import 'package:schoolmanagement/Models/Event.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:schoolmanagement/Models/Holiday.dart';

import '../Models/Announcement.dart';
import '../global.dart';

class EventService {
  Future<List<Event>> getEvents() async {
    Response res = await http.get(Uri.parse("$localhost/events"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<Event> events = response.map((e) {
        return Event(
            e["title"],
            e["description"],
            DateTime.parse("2021-01-01 " + e["start_time"]),
            DateTime.parse("2021-01-01 " + e["end_time"]),
            DateTime.parse(e["date"] + " 00:00:00"));
      }).toList();
      return events;
    }
    return [];
  }

  Future<List<Holiday>> getHolidays() async {
    Response res = await http.get(Uri.parse("$localhost/holidays"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<Holiday> holidays = response
          .map((e) => Holiday(e["title"], e["description"],
              DateTime.parse(e["date"] + " 00:00:00")))
          .toList();
      return holidays;
    }
    return [];
  }

  Future<List<Announcement>> getAnnouncements() async {
    Response res = await http.get(Uri.parse("$localhost/announcements"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<Announcement> announcements = response
          .map((e) => Announcement(e["tutor_name"], e["tutor_id"], e["title"], e["description"], DateTime.parse(e["created"])))
          .toList();

      return announcements;
    }
    return [];
  }
}
