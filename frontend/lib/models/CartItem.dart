import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;

class CartItem extends ChangeNotifier {


  List productsList = [];
   List offersList = [];


   getProduct() async {
    var url = Uri.parse('${serverURL}products');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      //setState(() {
        productsList = jsonObj['result'];
    //  });
    }
  }

   getOffers() async {
     var url = Uri.parse('${serverURL}offer');
     var res = await http.get(url);
     if (res.statusCode == 200) {
       var jsonObj = json.decode(res.body);
  //     setState(() {
         offersList = jsonObj['result'];
         print(offersList);
    //   });
     }
   }
}
