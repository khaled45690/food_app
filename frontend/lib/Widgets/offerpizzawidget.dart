import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/sandwichScreen.dart';

import 'listtile_widget.dart';

class OfferpizzaWidget extends StatelessWidget {
  final Map productInfo;
  const OfferpizzaWidget(this.productInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (productInfo['category']=="PZ")
        Listtile_widet(productInfo["name"], productInfo["price"].toString(),
            () {
             Navigator.pushNamed(context, SandwichScreen.roteName,
                arguments: productInfo);
        }),
      ],
    );
  }
}
