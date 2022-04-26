import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanagement/HomePage.dart';
import 'package:schoolmanagement/Providers/Navigation.dart';
import 'package:schoolmanagement/SessionCheck.dart';
import 'package:schoolmanagement/SignIn/SignInScreen.dart';

import 'Pages/ProfileTab/ProfileScreen.dart';
import 'Providers/Calendar.dart';
import 'Pages/RoutineTab/RoutineTab.dart';
import 'Providers/Routine.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Navigation(),
        ),
        ChangeNotifierProvider(
          create: (_) => Calendar(),
        ),
        ChangeNotifierProvider(
          create: (_) => RoutineManagement(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:SessionCheck(),
    );
  }
}
