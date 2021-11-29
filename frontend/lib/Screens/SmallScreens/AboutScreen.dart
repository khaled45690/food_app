// ignore_for_file: file_names

import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  static const routename ='/About';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
            title: Text(
              "About",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            shape:
                const Border(bottom: BorderSide(color: Colors.red, width: 2)),
            backgroundColor: Colors.white,
          ),

      
    );
  }
}