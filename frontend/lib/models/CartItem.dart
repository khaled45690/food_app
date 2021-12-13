import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier {
  List _cartList = [];

  int _total = 0;
  int get total => _total;
  set total(int totalprice) {
    _total = totalprice;
  }

  List get cartList => _cartList;
  set cartList(List cartListParameter) {
    _cartList = cartListParameter;
    notifyListeners();
  }

  geTotal(Map productInfo) {
    cartList.forEach((e) {
      if (e["id"] == productInfo["id"]) {
        total = productInfo["price"] * productInfo["quantity"];
        notifyListeners();
      } else {
        total = productInfo["price"] * productInfo["quantity"];
        notifyListeners();
      }
    });
  }

  addCartItem(Map productInfo) {
    if (_cartList.any((element) => element["id"] == productInfo["id"])) {
      _cartList.remove(productInfo);

      total -= int.parse(productInfo["price"].toString()) *
          int.parse(productInfo["quantity"].toString());
      print(total);

      // print(total);

    } else {
      _cartList.add(productInfo);
      total += int.parse(productInfo["price"].toString()) *
          int.parse(productInfo["quantity"].toString());
      print(total);
    }

    notifyListeners();
    print(_cartList);
  }

  // removeCartItem(Map productInfo){
  //   var filter =[];
  //   cartList.forEach((e) {
  //     if(e["id"] == productInfo["id"]){

  //     }else{
  //       filter.add(e);
  //   }
  //   });

  //   cartList=filter;
  //   notifyListeners();
  // }

}
