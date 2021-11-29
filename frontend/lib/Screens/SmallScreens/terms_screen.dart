import 'package:flutter/material.dart';

class Terms_screen extends StatelessWidget {
  const Terms_screen({ Key? key }) : super(key: key);
  static const roteName ='/TermsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text(
            "Terms",style: TextStyle(fontSize: 18,color: Colors.black),
            ),
          shape:const Border(bottom: BorderSide(color: Colors.red ,width: 2)),

            backgroundColor: Colors.white,),

      
    );
  }
}