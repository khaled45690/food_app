
import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier {
  List _cartList = [];

  List get cartList => _cartList;
   set cartList(List cartListParameter){
    _cartList = cartListParameter;
     notifyListeners();
   }

  addCartItem(Map productInfo){
     print(_cartList.any((element) => element["id"] == productInfo["id"]));
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
    List filter = [];
    _cartList.map((e) => {
      if(e["id"] == productInfo["id"]){



      }else{
        filter.add(productInfo),
             notifyListeners()

      }
      
    });
    cartList = filter;
  }



}
