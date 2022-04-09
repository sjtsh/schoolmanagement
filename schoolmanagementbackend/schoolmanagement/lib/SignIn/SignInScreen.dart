import 'package:flutter/material.dart';
import 'package:schoolmanagement/HomePage.dart';
import 'package:schoolmanagement/Services/UserService.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(

        onWillPop: () { return Future.value(false); },
        child: Scaffold(
          backgroundColor: Color(0xff1C1C1C),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/logo.png"),
                                fit: BoxFit.contain)),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: usernameController,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    label: Text(
                                      "Enter your username",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    fillColor: Color(0xff404040),
                                    filled: true),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 50,
                              child: TextField(
                                controller: passController,
                                cursorColor: Colors.white,
                                obscureText: true,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    label: Text(
                                      "Enter your password",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    fillColor: Color(0xff404040),
                                    filled: true),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () async {
                              bool result = await UserService().logIn(
                                  usernameController.text,
                                  passController.text,
                                  context);
                              if (result) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return HomePage();
                                }));
                              }
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
                                  "Log in",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "Please contact your respective teacher for the registration or password change",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
