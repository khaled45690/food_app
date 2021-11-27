import 'package:flutter/material.dart';

class Appbarr_widget extends StatelessWidget {
//   final String name ;
//  const Appbarr_widget(this.name);

  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: const Center(
            child: Text(
              "Addresses",style: TextStyle(fontSize: 18,color: Colors.black),
              ),
              
              
          ),
          shape:const Border(bottom: BorderSide(color: Colors.red ,width: 2)),

            backgroundColor: Colors.white,);
  }
}