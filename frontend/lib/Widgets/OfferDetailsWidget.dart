import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/sandwichScreen.dart';

import 'listtile_widget.dart';

class OfferDetailsWidget extends StatelessWidget {
  final Map productInfo;
  const OfferDetailsWidget(this.productInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Listtile_widet(
          productInfo["name"], productInfo["price"].toString(),
           () {
           Navigator.pushNamed(context, SandwichScreen.roteName,
           arguments:  productInfo
                
                );
        }),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
