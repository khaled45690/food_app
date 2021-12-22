import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/productsWidget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {


  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
    List productsList = [];



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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xffb74093),

      body: ListView(
        children: [
     //        Text("data"),
 Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                    child: Text("NameOfProduct",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 13),
                    child: Text(
                      "price",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    
                  ),
                Container(
                    margin: EdgeInsets.only(right: 13),
                    child: Text(
                      "pricemax",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ))
                ],
              ),
            )),
      ],
    ),
            for (int i = 0; i < productsList.length; i++)
                        ProductsWidget(productsList[i]),


        ],
      ),
      
    );
  }
}