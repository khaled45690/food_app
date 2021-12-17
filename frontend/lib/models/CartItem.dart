import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List _cartList = [];

  int _total = 0;
  int get total => _total;
  set total(int totalprice) {
    _total = totalprice;
    notifyListeners();
  }

  List get cartList => _cartList;
  set cartList(List cartListParameter) {
    _cartList = cartListParameter;
    notifyListeners();
  }



  addCartItem(
    Map productInfo,
    int quantity,
  ) async {
    if (_cartList.any((element) => element["id"] == productInfo["id"])) {
      removeCartItem(productInfo);
      addCartItem(productInfo,quantity,);
      //  final SharedPreferences prefs =  await _prefs;
      //  prefs.setString("cartshop",jsonEncode( addCartItem(productInfo , quantity,price )) );
          notifyListeners();

    } else {
      productInfo["quantity"] = quantity;

      if (productInfo["xlarge"] == true) {
        total += int.parse(productInfo["pricemax"].toString()) *
            int.parse(productInfo["quantity"].toString());
                    _cartList.add(productInfo);

                notifyListeners();

      } else {
        total += int.parse(productInfo["price"].toString()) *
            int.parse(productInfo["quantity"].toString());
                    _cartList.add(productInfo);

                notifyListeners();

      }
    }

    notifyListeners();
  }

  removeCartItem(
    Map productInfo,
  ) {
    var filter = [];
    cartList.forEach((e) {
      if (e["id"] == productInfo["id"]) {
        if (productInfo["xlarge"] == true) {
          total -= int.parse(e["pricemax"].toString()) *
              int.parse(e["quantity"].toString());
                  notifyListeners();

        }else{
          total -= int.parse(e["price"].toString()) *
              int.parse(e["quantity"].toString());
                  notifyListeners();


        }
      } else {
        filter.add(e);
      }
    });
    cartList = filter;
    notifyListeners();
  }
}
