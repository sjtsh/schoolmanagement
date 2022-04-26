import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Providers/Navigation.dart';

import '../../../Services/UserService.dart';

class ChangePasswordDialog extends StatefulWidget {
  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isValidatedOld = false;
  bool isValidatedConfirm = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    child: TextField(
                      controller: oldPasswordController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: Text(
                          "Enter your old password",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                        errorText: isValidatedOld ? "wrong old password" : null,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Color(0xff404040),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    child: TextField(
                      controller: newPasswordController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: Text(
                          "Enter your new password",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Color(0xff404040),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    child: TextField(
                      controller: confirmPasswordController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: Text(
                          "Confirm Password",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                        errorText: isValidatedConfirm
                            ? "passwords did not match"
                            : null,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Color(0xff404040),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (newPasswordController.text !=
                        confirmPasswordController.text) {
                      isValidatedConfirm = true;
                    } else {
                      isValidatedConfirm = false;
                    }
                    if (oldPasswordController.text !=
                        context.read<Navigation>().meUser!.password) {
                      isValidatedOld = true;
                    } else {
                      isValidatedOld = false;
                    }
                    print(isValidatedOld.toString() + isValidatedConfirm.toString());
                    if (!isValidatedOld && !isValidatedConfirm) {
                      bool result = await UserService().updateUser(
                        context,
                        password: newPasswordController.text,
                      );
                      if (result) {
                        Navigator.pop(context);
                      }
                    }
                    setState(() {});
                  },
                  child: Container(
                    width: 200 - 24,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff1F944E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
