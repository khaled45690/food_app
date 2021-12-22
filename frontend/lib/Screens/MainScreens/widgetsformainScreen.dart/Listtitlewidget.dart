import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/sandwichScreen.dart';

class Listtitlewidgett extends StatefulWidget {
  final String nameOfFood;
  final String price;
  final String pricemax;
  final GestureTapCallback gestureDetector;
Listtitlewidgett(this.nameOfFood, this.price,this.pricemax, this.gestureDetector);

  @override
  State<Listtitlewidgett> createState() => _ListtitlewidgettState();
}

class _ListtitlewidgettState extends State<Listtitlewidgett> {
  bool value = false;

  Widget buildChckbox() => Checkbox(
      value: value,
      onChanged: (value) {
        setState(() {
          this.value = value!;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                    child: Text(widget.nameOfFood,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Spacer(),
                  Container(
                    
                    margin: EdgeInsets.only(right: 93),
                    child: Text(
                      widget.price,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    
                  ),
                Container(
                    margin: EdgeInsets.only(right: 13),
                    child: Text(
                      widget.pricemax,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ))
                ],
              ),
            )),
      ],
    );

  }
}
