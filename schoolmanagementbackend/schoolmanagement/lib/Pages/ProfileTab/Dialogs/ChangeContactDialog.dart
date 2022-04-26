import 'package:flutter/material.dart';

import '../../../Services/UserService.dart';

class ChangeContactDialog extends StatefulWidget {
  @override
  State<ChangeContactDialog> createState() => _ChangeContactDialogState();
}

class _ChangeContactDialogState extends State<ChangeContactDialog> {
  TextEditingController contactController = TextEditingController();
  bool isValidated = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
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
                      controller: contactController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: Text(
                          "New Contact",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                        errorText:
                            isValidated ? "contact must be 10 digits" : null,
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
                    if (contactController.text.length == 10) {
                      bool result = await UserService()
                          .updateUser(context, contact: contactController.text);
                      if (result) {
                        Navigator.pop(context);
                      }
                    } else {
                      isValidated = true;
                      setState(() {});
                    }
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
