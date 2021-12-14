import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier {
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

  addCartItem(Map productInfo, int quantity,int price) {
    if (_cartList.any((element) => element["id"] == productInfo["id"])) {
      removeCartItem(productInfo);
      addCartItem(productInfo , quantity,price );
    } else {
      productInfo["quantity"] = quantity;
            productInfo["price"] = price;

      if(productInfo["xlarge"] == true){
        productInfo["price"] ++;
         productInfo["price"] ++;

        print( productInfo["price"]);

      }
      _cartList.add(productInfo);
      total += int.parse(productInfo["price"].toString()) *
          int.parse(productInfo["quantity"].toString());
    }

    notifyListeners();
  }

  removeCartItem(Map productInfo,  ) {
    var filter = [];
    cartList.forEach((e) {
      if (e["id"] == productInfo["id"]) {
      if(productInfo["xlarge"] == true){
        productInfo["price"] --;
        productInfo["price"] --;

        print( productInfo["price"]);

      }
        
        total -= int.parse(e["price"].toString()) *
            int.parse(e["quantity"].toString());
      } else {
        filter.add(e);
      }
    });
    cartList = filter;
    notifyListeners();
  }
}
