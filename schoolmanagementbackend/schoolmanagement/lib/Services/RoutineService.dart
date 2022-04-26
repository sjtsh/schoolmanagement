import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Models/Schedule.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Models/Exam.dart';
import '../Providers/Navigation.dart';
import '../global.dart';

class RoutineService {
  Future<List<Routine>> getRoutines(BuildContext context) async {
    Response res = await http.get(Uri.parse("$localhost/routines/${context.read<Navigation>().meUser!.id}"));
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

  Future<List<Exam>> getExams(BuildContext context) async {
    Response res = await http.get(Uri.parse("$localhost/exams/${context.read<Navigation>().meUser!.id}"));
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
