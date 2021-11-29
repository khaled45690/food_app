import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/divider.dart';
import 'package:food_app/Widgets/listtile_widget.dart';
import 'package:food_app/Widgets/meal_widget.dart';
import 'package:food_app/Widgets/vdivider.dart';

class ShowMenu extends StatefulWidget {
  const ShowMenu({Key? key}) : super(key: key);
  static const roteName = '/ShowMenur';

  @override
  _ShowMenuState createState() => _ShowMenuState();
}

class _ShowMenuState extends State<ShowMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),

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
              onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(
                               builder:(context)=>Cartshopscreen(),
                               ),
                               );
              },
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
        children: <Widget>[
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/krs.jpg"),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          MealWidget("assets/images/zz.jpg"),
         
          MealWidget("assets/images/zzz.jpg"),
          MealWidget("assets/images/zzz.jpg"),
         Listtile_widet("شاورما فراخ","32"),
          Divider(
            color: Colors.grey,
          ),
          Listtile_widet("شاورما لحمه","35"),
          Divider(
            color: Colors.grey,
          ),
         Listtile_widet("بطاطس بالجبنه","16"),
         Divider(
            color: Colors.grey,
          ),
         Listtile_widet("كرسبي","28"),
         Divider(
            color: Colors.grey,
          ),
         Listtile_widet("فاهيتا","26"),

        ],
      ),
    );
  }
}
