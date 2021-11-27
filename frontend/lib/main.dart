import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/AboutScreen.dart';
import 'package:food_app/Screens/SmallScreens/FirstPageSmallScreen.dart';
import 'package:food_app/Screens/SmallScreens/addresses_screen.dart';
import 'package:food_app/Screens/SmallScreens/privacy_screen.dart';
import 'package:food_app/Screens/SmallScreens/profile_screen.dart';
import 'package:food_app/Screens/SmallScreens/splashscreen.dart';
import 'package:food_app/Screens/SmallScreens/terms_screen.dart';

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
      home: const SplashScreen(),
      routes:  {
        FirstPageScreen.roteName:(ctx) =>  FirstPageScreen(),
        ProfileScreen.roteName:(ctx) => const ProfileScreen(),
        Addresses_screen.roteName:(ctx) => const Addresses_screen(),
        Terms_screen.roteName:(ctx) => const Terms_screen(),
        AboutScreen.routename:(ctx) => const AboutScreen(),
        Privacy_screen.roteName:(ctx) => const Privacy_screen(),
      },
    );
  }
}

