import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Screens/SmallScreens/diliveryScreen.dart';
import 'package:food_app/Screens/SmallScreens/sandwichScreen.dart';
import 'package:food_app/Widgets/AppBar_ShowMenu.dart';
import 'package:food_app/Widgets/OfferDetailsWidget.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/divider.dart';
import 'package:food_app/Widgets/listtile_widget.dart';
import 'package:food_app/Widgets/meal_widget.dart';
import 'package:food_app/Widgets/vdivider.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;

class ShowMenu extends StatefulWidget {
  const ShowMenu({Key? key}) : super(key: key);
  static const roteName = '/ShowMenur';

  @override
  _ShowMenuState createState() => _ShowMenuState();
}

class _ShowMenuState extends State<ShowMenu> {
   List productsList = [];
   List offersList = [];

  getProduct() async {
    var url = Uri.parse('${serverURL}products');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      setState(() {
        productsList = jsonObj['result'];
      });
    }
  }

   getOffers() async {
     var url = Uri.parse('${serverURL}offer');
     var res = await http.get(url);
     if (res.statusCode == 200) {
       var jsonObj = json.decode(res.body);
       setState(() {
         offersList = jsonObj['result'];
         print(offersList);
       });
     }
   }

  @override
  void initState() {
    super.initState();
    getProduct();
    getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_ShowMenu(),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/krs.jpg"),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          for(int i = 0; i < offersList.length; i++)
            MealWidget("${serverURL}image?name=${offersList[i]["imagename"]}"),
          for (int i = 0; i < productsList.length; i++)
            OfferDetailsWidget(productsList[i]),
        ],
      ),
    );
  }
}
