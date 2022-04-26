import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Providers/Navigation.dart';
import 'package:schoolmanagement/SignIn/SignInScreen.dart';
import 'package:schoolmanagement/global.dart';

import 'Dialogs/ChangeContactDialog.dart';
import 'Dialogs/ChangePasswordDialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1C1C1C),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset("assets/logo.png"),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff404040),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      [
                        "Student ID",
                        "#SD${context.watch<Navigation>().meUser!.id.toString().padLeft(5, "0")}"
                      ],
                      ["Name", context.watch<Navigation>().meUser!.name],
                      [
                        "Year",
                        getPosition(context.watch<Navigation>().meUser!.year)
                      ],
                      [
                        "Position",
                        getPosition(
                            context.watch<Navigation>().meUser!.position)
                      ],
                      [
                        "Attendance",
                        "${context.watch<Navigation>().meUser!.attendance}%"
                      ],
                      ["Contact", context.watch<Navigation>().meUser!.contact]
                    ]
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                children: [
                                  Text(
                                    e[0],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Expanded(child: Container()),
                                  Text(e[1],
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8)))
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff404040),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return ChangePasswordDialog();
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.white.withOpacity(0.5)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              "Change Password",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return ChangeContactDialog();
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.transparent))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Row(
                          children: [
                            Text(
                              "Change Contact",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return SignInScreen();
                }));
              },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xff1F944E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Log out",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
