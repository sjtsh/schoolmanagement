import 'package:flutter/material.dart';
import 'package:schoolmanagement/HomePage.dart';
import 'package:schoolmanagement/Services/UserService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignIn/SignInScreen.dart';

class SessionCheck extends StatelessWidget {
  const SessionCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance().then((prefs) async {
          int id = prefs.getInt("session") ?? -1;
          if (id != -1) {
            bool a = await UserService().logInWithSession(id, context);
            return a;
          } else {
            return false;
          }
        }),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            bool isSession = snapshot.data;
            if (isSession) {
              return HomePage();
            }
            return SignInScreen();
          }
          return SignInScreen();
        });
  }
}
