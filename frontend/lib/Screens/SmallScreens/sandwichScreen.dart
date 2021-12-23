import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Widgets/AppBar_ShowMenu.dart';
import 'package:food_app/Widgets/sandwichwidget.dart';
import 'package:food_app/models/CartItem.dart';
import 'package:provider/src/provider.dart';


class SandwichScreen extends StatefulWidget {
  const SandwichScreen({Key? key}) : super(key: key);
  static const roteName = '/SandwichScreen';

  @override
  _SandwichScreenState createState() => _SandwichScreenState();
}

class _SandwichScreenState extends State<SandwichScreen> {
  Map ProductInfo = {};
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    String offerInfoString =
        jsonEncode(ModalRoute.of(context)!.settings.arguments);
    setState(() {
      ProductInfo = jsonDecode(offerInfoString);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      iconTheme: IconThemeData(color: Colors.grey, size: 30),
      backgroundColor: Colors.white54,
      shadowColor: Colors.white54,
      actions: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 120),
                child: Text(
                 ProductInfo['name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          ),
         // Divider_widget(),


          Stack(
            children:[
             CircleAvatar(
               radius: 8,
               backgroundColor: Colors.red,
               child: Text(
                 "${context.watch<CartItem>().itemCount}"

                 ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
             ),
               IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Cartshopscreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
                size: 28,
              ),
            ),
            ],
          ),
        ])
      ],
    ),
      body: Sandwichwidget()
    );
  }



}
