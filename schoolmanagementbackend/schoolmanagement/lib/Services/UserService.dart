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
        context.read<Navigation>().meUser = User(
            response["id"],
            response["name"],
            response["year"],
            response["position"],
            response["attendance"],
            response["contact"],
            DateTime.parse(response["created"]),
            response["password"]);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt("session", context.read<Navigation>().meUser!.id);
        return true;
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Try Again")));
    return false;
  }

  Future<bool> updateUser(BuildContext context,
      {String? password, String? contact, String? img}) async {
    Map<String, String> aJson = {
      "id": context.read<Navigation>().meUser!.id.toString()
    };
    if (password != null) {
      aJson["password"] = password;
    }
    if (contact != null) {
      aJson["contact"] = contact;
    }
    if (img != null) {
      aJson["img"] = img;
    }
    Response res =
        await http.put(Uri.parse("$localhost/user/update/"), body: aJson);
    if (res.statusCode == 200) {
      if (jsonDecode(res.body) == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Incorrect Credentials")));
        return false;
      } else {
        Map<String, dynamic> response = jsonDecode(res.body);
        context.read<Navigation>().meUser = User(
            response["id"],
            response["name"],
            response["year"],
            response["position"],
            response["attendance"],
            response["contact"],
            DateTime.parse(response["created"]),
            response["password"]);
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
        int a = response["id"];
        String name = response["name"];
        int year = response["year"];
        int position = response["position"];
        int attendance = response["attendance"];
        String contact = response["contact"];
        DateTime created =
        DateTime.parse(response["created"].toString().substring(0, 19));
        String password = response["password"];
        context.read<Navigation>().setUser(User(
            id, name, year, position, attendance, contact, created, password));
        return true;
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Try Again")));
    return false;
  }
}
