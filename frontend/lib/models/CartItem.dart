
import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier {
  List _cartList = [];

  List get cartList => _cartList;
   set cartList(List cartListParameter){
     _cartList = cartListParameter;
     notifyListeners();
   }

  addCartItem(Map productInfo){
    _cartList.add(productInfo);
  }

  removeCartItem(Map productInfo){
    List filter = [];
    _cartList.map((e) => {
      if(e["id"] == productInfo["id"]){

      }else{
        filter.add(productInfo)
      }
    });
    cartList = filter;
  }


}
