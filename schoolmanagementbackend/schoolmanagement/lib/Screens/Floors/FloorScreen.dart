import 'package:flutter/material.dart';
import 'package:schoolmanagement/Screens/Floors/Floor1.dart';

class Floor extends StatelessWidget {
  const Floor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.1)),
                ]),
            child: Center(
              child: Text(
                "Pick a room",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Floor 1"),
                ),
                Divider(
                  height: 2,
                  thickness: 3,
                ),
                Floor1(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Floor 2"),
                ),
                Divider(
                  height: 2,
                  thickness: 3,
                ),
                Floor1(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
