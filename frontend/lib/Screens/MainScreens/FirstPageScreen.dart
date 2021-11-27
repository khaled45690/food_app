import 'package:flutter/material.dart';
import 'package:food_app/Widgets/drawer_menuu.dart';



class First_screen extends StatefulWidget {
  const First_screen({ Key? key }) : super(key: key);

  @override
  _First_screenState createState() => _First_screenState();
}

class _First_screenState extends State<First_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer_Widget(),
      
    );
  }
}
