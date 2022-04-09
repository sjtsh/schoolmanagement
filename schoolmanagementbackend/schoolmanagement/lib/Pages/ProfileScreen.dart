import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolmanagement/global.dart';

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
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(0xff404040),
                            shape: BoxShape.circle,
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
                      ["Student ID", "#SD${meUser!.id.toString().padLeft(5,"0")}"],
                      ["Name", meUser!.name],
                      ["Year", getPosition(meUser!.year)],
                      ["Position", getPosition(meUser!.position)],
                      ["Attendance", "${meUser!.attendance}%"],
                      ["Contact", meUser!.contact]
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
                  ...[
                    "Change Password",
                    "Change Photo",
                    "Change Contact",
                  ]
                      .map((e) => Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: e != "Change Contact"
                                            ? Colors.white.withOpacity(0.5)
                                            : Colors.transparent))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 12),
                              child: Row(
                                children: [
                                  Text(
                                    e,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ]),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
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
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
