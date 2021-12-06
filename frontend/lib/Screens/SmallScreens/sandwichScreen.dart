import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/largeOrxlage.dart';
import 'package:food_app/Widgets/listtile_widget.dart';
import 'package:food_app/Widgets/vdivider.dart';
import 'package:food_app/models/CartItem.dart';
import 'package:provider/provider.dart';

class SandwichScreen extends StatefulWidget {
  const SandwichScreen({Key? key}) : super(key: key);
  static const roteName = '/SandwichScreen';

  @override
  _SandwichScreenState createState() => _SandwichScreenState();
}

class _SandwichScreenState extends State<SandwichScreen> {
  int _quantity = 0;
  bool? _checked = true;
  bool? _checked1 = false;
  @override
  void initState() {
    super.initState();
    if (_checked == _checked1) {
      _checked != _checked1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white54,
        shadowColor: Colors.white54,
        actions: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            //   Divider_widget(),

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
                size: 31,
                color: Colors.grey,
              ),
            ),
            Divider_widget(),

            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => Cartshopscreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
                size: 28,
              ),
            ),
          ])
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "    Size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: _checked1! ? Colors.blue.shade50 : Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        "لارج",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      dense: true,
                      value: _checked1,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            _checked1 = value;
                            _checked = false;
                          }
                        });
                      },
                      activeColor: Colors.blueGrey,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: _checked! ? Colors.blue.shade50 : Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        "اكس لارج",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      dense: true,
                      value: _checked,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            _checked = value;
                            _checked1 = false;
                          }
                        });
                      },
                      activeColor: Colors.blueGrey,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "   Special Instructions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextFormField(
                        minLines: 2,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintText: "Example: No pepper/ sugar /salt Please",
                            helperStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))))),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text(
                    "   Quantity",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 1.92,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                      _quantity.toString(),
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: subtract,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 11,
                      width: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.black),
                      ),
                      child: GestureDetector(
                          onTap: subtract,
                          child: SizedBox(
                            child: Icon(
                              Icons.remove,
                              size: 30,
                              color: Colors.white,
                            ),
                            height: 28,
                          )),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 11,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                    ),
                    child: GestureDetector(
                        onTap: add,
                        child: SizedBox(
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                          height: 28,
                        )),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Button_Widget("Add to cart",
                MediaQuery.of(context).size.width, 75, Colors.orange, () {
              CartItem cartItem = Provider.of<CartItem>(context, listen: false);
              cartItem.addProductsToCart([]);
            }),
          ),
        ],
      ),
    );
  }

  subtract() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  add() {
    setState(() {
      _quantity++;
    });
  }
}
