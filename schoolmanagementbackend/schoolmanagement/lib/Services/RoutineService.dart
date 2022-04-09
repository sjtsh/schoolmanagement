import 'dart:convert';

import 'package:schoolmanagement/Models/Schedule.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Models/Exam.dart';
import '../global.dart';

class RoutineService {
  Future<List<Routine>> getRoutines() async {
    Response res = await http.get(Uri.parse("$localhost/routines/${meUser!.id}"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<Routine> routines = response
          .map((e) => Routine(
              e["module"], e["day"], DateTime.parse( "2021-01-01 " + e["start_time"]), DateTime.parse( "2021-01-01 " + e["end_time"]),
              remarks: e["remarks"], meetLink: e["meet_link"]))
          .toList();
      return routines;
    }
    return [];
  }

  Future<List<Exam>> getExams() async {
    Response res = await http.get(Uri.parse("$localhost/exams/${meUser!.id}"));
    if (res.statusCode == 200) {
      List<dynamic> response = jsonDecode(res.body);
      List<Exam> exams = response
          .map((e) => Exam(
          e["module"], DateTime.parse(e["day"] +" 00:00:00"), DateTime.parse( "2021-01-01 " + e["start_time"]), DateTime.parse( "2021-01-01 " + e["end_time"]),))
          .toList();
      return exams;
    }
    return [];
  }
}
