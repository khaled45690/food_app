import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/mealsdetailsscree.dart';
import 'package:food_app/Widgets/button_widget.dart';

class MealWidget extends StatelessWidget {
  final String imagee;

  MealWidget(this.imagee);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.55,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imagee),
        ),
      ),
      margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        children: [
          Text(
            "عرض الزياده ب100 جنيه                             ",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Spacer(),
          Spacer(),

          //   Spacer(),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button_Widget(
                  "learn more",
                  MediaQuery.of(context).size.width / 2.4,
                  MediaQuery.of(context).size.height / 13,
                  Colors.black12, () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "What you get:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "*Special offer for 100 EGP",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Conditions:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "*Order Type:Pickup,Delivery",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        content: Container(
                          width: 400,
                          height: 140,
                          child: Column(
                            children: [
                              Button_Widget(
                                  "Get it now",
                                  MediaQuery.of(context).size.width / 1.75,
                                  60,
                                  Colors.orange,
                                  () {}),
                              SizedBox(height: 15),
                              Button_Widget(
                                  "Back to menu",
                                  MediaQuery.of(context).size.width / 1.75,
                                  60,
                                  Colors.grey,
                                  () {}),
                            ],
                          ),
                        ),
                        actions: <Widget>[],
                      );
                    });
              }),
              Spacer(),
              Button_Widget(
                  "Get it now",
                  MediaQuery.of(context).size.width / 2.25,
                  MediaQuery.of(context).size.height / 13,
                  Colors.orange, () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => MealScreen(),
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
