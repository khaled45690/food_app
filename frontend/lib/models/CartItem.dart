
import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier {
  List _cartList = [];

  List get cartList => _cartList;
   set cartList(List cartListParameter){
    _cartList = cartListParameter;
     notifyListeners();
   }

  addCartItem(Map productInfo){
     if( _cartList.any((element) => element["id"] == productInfo["id"])){
       removeCartItem(productInfo);
       addCartItem(productInfo);
     }else{
       _cartList.add(productInfo);
     }
    notifyListeners();
    print(_cartList);
  }

  removeCartItem(Map productInfo){
    var filter =[];
    cartList.forEach((e) {
      if(e["id"] == productInfo["id"]){
        
      }else{
        filter.add(e);
    }
    });

    cartList=filter;
    notifyListeners();
  }



}
