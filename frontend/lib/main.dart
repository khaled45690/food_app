import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/firstPageScreen.dart';
import 'package:food_app/Screens/SmallScreens/AboutScreen.dart';
import 'package:food_app/Screens/SmallScreens/FirstPageSmallScreen.dart';
import 'package:food_app/Screens/SmallScreens/addresses_screen.dart';
import 'package:food_app/Screens/SmallScreens/privacy_screen.dart';
import 'package:food_app/Screens/SmallScreens/profile_screen.dart';
import 'package:food_app/Screens/SmallScreens/terms_screen.dart';

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
       
        primarySwatch: Colors.blue,
      ),
      home: const FirstPageSmallScreen(),
      routes: {
        FirstPageSmallScreen.routename:(ctx) => FirstPageSmallScreen(),
        ProfileScreen.roteName:(ctx) =>ProfileScreen(),
        Addresses_screen.roteName:(ctx) =>Addresses_screen(),
        Terms_screen.roteName:(ctx) => Terms_screen(),
        AboutScreen.routename:(ctx) => AboutScreen(),
        Privacy_screen.roteName:(ctx) => Privacy_screen(),
      },
    );
  }
}

