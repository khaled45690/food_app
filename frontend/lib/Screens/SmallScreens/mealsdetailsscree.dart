import 'package:flutter/material.dart';
import 'package:food_app/Widgets/vdivider.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);
  static const roteName = '/MealScreen';

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        shadowColor: Colors.white54,
        actions: <Widget>[
          Row(children: <Widget>[
            Divider_widget(),
            Text(
              "خواطر دمشقيه",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            Divider_widget(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.info_outline,
                size: 32,
                color: Colors.grey,
              ),
            ),
            Divider_widget(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
                size: 32,
              ),
            ),
          ])
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/krs.jpg"),
            )),
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "       العروض اليوميه",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "        اقوي العروض و الخصومات لايام محدوده",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/di.jpg"),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
