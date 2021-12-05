import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CartItem extends ChangeNotifier
{

  getProduct()async{
    var url =Uri.parse('http://localhost:4000/products');
    var res = await http.get(url);
   if(res.statusCode == 200){
     var jsonObj =json.decode(res.body);
     return jsonObj['result'];
   }
    
 }

 List products=[];

 addProductsToCart(product){
   products.add(product);
   notifyListeners();
 }


}