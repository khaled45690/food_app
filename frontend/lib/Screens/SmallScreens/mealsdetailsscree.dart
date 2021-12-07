import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Widgets/AppBar_ShowMenu.dart';
import 'package:food_app/Widgets/vdivider.dart';
import 'package:food_app/contant/constant.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);
  static const roteName = '/MealScreen';

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  Map offerInfo = {};
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    String offerInfoString = jsonEncode(ModalRoute.of(context)!.settings.arguments);
    setState(() {
      offerInfo = jsonDecode(offerInfoString);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_ShowMenu(imageName: offerInfo["description"],),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.network("${serverURL}image?name=${offerInfo["imagename"]}").image,
            )),
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "العروض اليوميه",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "اقوي العروض و الخصومات لايام محدوده",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //   fit: BoxFit.fill,
                //   image: NetworkImage("http://192.168.1.6:4000/image?name=whiteFriday.jpg"),
                // )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
