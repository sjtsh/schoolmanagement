import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Models/User.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:schoolmanagement/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/Navigation.dart';

class UserService {
  Future<bool> logIn(
      String username, String password, BuildContext context) async {
    Response res = await http.post(Uri.parse("$localhost/signin/"), body: {
      "name": username,
      "password": password,
    });
    if (res.statusCode == 200) {
      if (jsonDecode(res.body) == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Incorrect Credentials")));
        return false;
      } else {
        Map<String, dynamic> response = jsonDecode(res.body);
        meUser = User(
            response["id"],
            response["name"],
            response["year"],
            response["position"],
            response["attendance"],
            response["contact"],
            response["img"],
            DateTime.parse(response["created"]),
            response["password"]);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt("session", meUser!.id);
        return true;
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Try Again")));
    return false;
  }

  Future<bool> logInWithSession(int id, BuildContext context) async {
    Response res =
        await http.post(Uri.parse("$localhost/signinwithsession/"), body: {
      "id": id.toString(),
    });
    print(res.body);
    if (res.statusCode == 200) {
      if (jsonDecode(res.body) == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Incorrect Credentials")));
        return false;
      } else {
        Map<String, dynamic> response = jsonDecode(res.body);
        meUser = User(
            response["id"],
            response["name"],
            response["year"],
            response["position"],
            response["attendance"],
            response["contact"],
            response["img"],
            DateTime.parse(response["created"]),
            response["password"]);
        return true;
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Try Again")));
    return false;
  }
}
