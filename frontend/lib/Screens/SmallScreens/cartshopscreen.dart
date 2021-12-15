import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/OfferDetailsWidget.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/buttonwidgettotal%20price.dart';
import 'package:food_app/Widgets/cartisemptywidget.dart';
import 'package:food_app/Widgets/cartshopwidget.dart';
import 'package:food_app/Widgets/vdivider.dart';
import 'package:food_app/models/CartItem.dart';
import 'package:food_app/models/UserData.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cartshopscreen extends StatefulWidget {
  static const roteName = '/CartShop';

  @override
  _CartshopscreenState createState() => _CartshopscreenState();
}

class _CartshopscreenState extends State<Cartshopscreen> {
  List productList = [];
  Map productInfo = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
                   //   print(context.read<UserData>().userData);


// final Future<SharedPreferences> prefs =   SharedPreferences.getInstance();
//         prefs.getString("userData");

SharedPreferences.getInstance().then((data){
    data.getKeys().forEach((key){
      print(key+(key));
    });
});

              //  context.read<UserData>().getUserData();
              //    context.read<UserData>().getUserAddressData();



    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    //       print(cartItem.cartList);
    setState(() {
      productList = cartItem.cartList;
    });
    print(productList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "خواطر دمشقيه",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white54,
        shadowColor: Colors.white54,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 35,
              ),
              context.watch<CartItem>().cartList.length == 0
                  ? CartIsempty()
                  : CartshopWidget(),
              SizedBox(
                height: 35,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  context.watch<CartItem>().cartList.length == 0
                      ? ListTile(
                          leading: Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          trailing: Text("0.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        )
                      : Column(
                          children: [
                            for (int i = 0; i < 1; i++)
                              ListTile(
                                trailing: Text(
                                  "\$ ${context.watch<CartItem>().total}"
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Text(
                                  "Total".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                          ],
                        )
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                for (int i = 0;
                    i <= context.read<CartItem>().cartList.length;
                    i++)
                    context.read<CartItem>().cartList.length == 0 ?Button_Widget_totaol("Go to Checkout",
                    MediaQuery.of(context).size.width,
                    75,
                     Colors.orangeAccent,(){},"total"
                    ):
                  Button_Widget_totaol(
                           "BUY NOW".tr,
                      MediaQuery.of(context).size.width,
                      75,
                      Colors.orange,
                      () {
                                     


                      },
                      "total"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
