import 'package:flutter/material.dart';

import 'Screens/MainScreens/FirstPageScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xffb74093)
      ),
      home: const FirstPageScreen(),
      routes: const {
        // FirstPageSmallScreen.routename:(ctx) => const FirstPageSmallScreen(),
        // ProfileScreen.roteName:(ctx) => const ProfileScreen(),
        // Addresses_screen.roteName:(ctx) => const Addresses_screen(),
        // Terms_screen.roteName:(ctx) => const Terms_screen(),
        // AboutScreen.routename:(ctx) => const AboutScreen(),
        // Privacy_screen.roteName:(ctx) => const Privacy_screen(),
      },
    );
  }
}

