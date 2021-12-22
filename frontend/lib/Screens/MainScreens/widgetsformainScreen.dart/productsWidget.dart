import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/Listtitlewidget.dart';
import 'package:food_app/Screens/SmallScreens/sandwichScreen.dart';
import 'package:food_app/Widgets/listtile_widget.dart';


class ProductsWidget extends StatelessWidget {
  final Map productInfo;
  const ProductsWidget(this.productInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Listtitlewidgett(productInfo["name"], productInfo["price"].toString(), productInfo["pricemax"].toString(),
            () {
          
        }),
      ],
    );
  }
}
