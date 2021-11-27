// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/drawer_menuu.dart';

class FirstPageScreen extends StatefulWidget {
  const FirstPageScreen({Key? key}) : super(key: key);

  @override
  _FirstPageScreenState createState() => _FirstPageScreenState();
}

class _FirstPageScreenState extends State<FirstPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer_Widget(),
    );
  }
}
