import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/addoffer.dart';
import 'package:food_app/Screens/MainScreens/offerscreen.dart';
import 'package:food_app/Screens/MainScreens/productsscreen.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/buttonWidget.dart';

class WellcomeScreen extends StatelessWidget {
  static const routename = '/Welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb74093),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  //height: MediaQuery.of(context).size.height/15,
                  width: MediaQuery.of(context).size.width / 8,
                  child: ButtonWidget('عرض قائمه المنيو', () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => ProductScreen(),
                      ),
                    );
                  })),
              SizedBox(
                height: 25,
              ),
              Container(
                  //   height: MediaQuery.of(context).size.height/15,
                  width: MediaQuery.of(context).size.width / 8,
                  child: ButtonWidget('عرض قائمه العروض ', () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => OfferScreen(),
                      ),
                    );
                  })),
              SizedBox(
                height: 25,
              ),
              Container(
                  //    height: MediaQuery.of(context).size.height/15,

                  width: MediaQuery.of(context).size.width / 8,
                  child: ButtonWidget('اضافه عرض جديد', () {
    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => addoffer(),
                      ),
                    );


                  }))
            ],
          ),
        ],
      ),
    );
  }
}
