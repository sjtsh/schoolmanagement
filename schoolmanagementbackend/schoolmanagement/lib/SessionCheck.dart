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
          if (id == -1) {
            return false;
          }
          return await UserService()
              .logInWithSession(id, context)
              .then((value) {
            print("guei");
            return value;
          });
        }),
        builder: (context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            bool isSession = snapshot.data;
            print(snapshot.data);
            if (isSession) {
              print("session");
              return HomePage();
            }
            return SignInScreen();
          }
          return SignInScreen();
        });
  }
}
