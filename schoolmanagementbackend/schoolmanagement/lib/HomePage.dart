import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/Pages/NavBar.dart';
import 'package:schoolmanagement/Providers/Navigation.dart';

import 'Pages/AnnouncementTab/AnnouncementTab.dart';
import 'Pages/CalendarTab/CalendarTab.dart';
import 'Pages/RoutineTab/RoutineTab.dart';
import 'Providers/Calendar.dart';
import 'Providers/Routine.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Color(0xff1C1C1C),
        statusBarColor: Color(0xff1C1C1C)));
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Color(0xff1C1C1C),
          body: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: context.watch<Navigation>().index,
                  children: [AnnouncementTab(), CalendarTab(), RoutineTab()],
                ),
              ),
              NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
