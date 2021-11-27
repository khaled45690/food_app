import 'package:flutter/material.dart';
import 'package:food_app/Widgets/drawer_menuu.dart';
class FirstPageSmallScreen extends StatefulWidget {
  const FirstPageSmallScreen({ Key? key }) : super(key: key);
  static const routename = '/FirstPageScreen';


  @override
  State<FirstPageSmallScreen> createState() => _FirstPageSmallScreenState();
}

class _FirstPageSmallScreenState extends State<FirstPageSmallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
    //    leading: Icon(Icons.three_k_plus_outlined,color: Colors.grey,),

        title: Text("data",),
        centerTitle: true,
        
      ),
      drawer: Drawer_Widget(),
      
    );
  }
}