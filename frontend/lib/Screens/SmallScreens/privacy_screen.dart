import 'package:flutter/material.dart';


class Privacy_screen extends StatelessWidget {
  const Privacy_screen({ Key? key }) : super(key: key);
    static const roteName ='/Privacy';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: const Center(
            child: Text(
              "Privacy",style: TextStyle(fontSize: 18,color: Colors.black),
              ),
          ),
          shape:const Border(bottom: BorderSide(color: Colors.red ,width: 2)),

            backgroundColor: Colors.white,),
      
    );
  }
}