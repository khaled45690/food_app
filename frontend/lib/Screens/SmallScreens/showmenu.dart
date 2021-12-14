import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/AppBar_ShowMenu.dart';
import 'package:food_app/Widgets/OfferDetailsWidget.dart';
import 'package:food_app/Widgets/loadingspinner.dart';
import 'package:food_app/Widgets/meal_widget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        //    print(offersList);
      });
    }
  }
 isloading() async{
   if (loading == true){
     await Future.delayed(Duration(seconds: 2));
   return 
   setState(() {
          loading =false;

   });
  
   
 }
 }
  @override
  void initState() {
    super.initState();
    isloading();
    getProduct();
    getOffers();
    

  }
bool loading= true;
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

          loading == true ? SpinnerLoading(): 
          Column(
            children: [
                  for (int i = 0; i < offersList.length; i++)
            MealWidget(offersList[i]),
            for (int p = 0; p < productsList.length; p++)
              OfferDetailsWidget(productsList[p]),
            ],
          )
        
        ],
      ),
    );
  }
}
