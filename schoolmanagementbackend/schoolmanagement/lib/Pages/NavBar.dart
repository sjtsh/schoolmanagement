import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Providers/Navigation.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      strokeColor: Colors.white.withOpacity(0.5),
      iconSize: 25,
      currentIndex: context.watch<Navigation>().index,
      selectedColor: Colors.white,
      unSelectedColor: Colors.white.withOpacity(0.5),
      backgroundColor: Color(0xff404040),
      opacity: 1,
      onTap: (int i) {
        context.read<Navigation>().index = i;
      },
      items: [
        CustomNavigationBarItem(
          icon: Icon(
            Icons.announcement,
            color: context.watch<Navigation>().index == 0
                ? Colors.white
                : Colors.white.withOpacity(0.5),
          ),
          title: Text(
            "Announcements",
            style: TextStyle(
                color: context.watch<Navigation>().index == 0
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            Icons.calendar_today,
            color: context.watch<Navigation>().index == 1
                ? Colors.white
                : Colors.white.withOpacity(0.5),
          ),
          title: Text(
            "Events",
            style: TextStyle(
                color: context.watch<Navigation>().index == 1
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(
            Icons.schedule,
            color: context.watch<Navigation>().index == 2
                ? Colors.white
                : Colors.white.withOpacity(0.5),
          ),
          title: Text(
            "Schedule",
            style: TextStyle(
                color: context.watch<Navigation>().index == 2
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                fontSize: 10),
          ),
        ),
      ],
    );
  }
}
