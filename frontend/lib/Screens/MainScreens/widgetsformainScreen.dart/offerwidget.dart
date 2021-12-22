import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/mealsdetailsscree.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;

class Offerwidget extends StatelessWidget {
  final Map offerInfo;

  Offerwidget(this.offerInfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.55,
      width: MediaQuery.of(context).size.width / 1,
      margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        children: [
          Text(
            "عرض الزياده ب100 جنيه",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Spacer(),
          Spacer(),

          //   Spacer(),
      

        ],
      ),
    );
  }
}
