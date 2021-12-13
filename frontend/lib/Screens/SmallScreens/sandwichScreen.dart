import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Widgets/AppBar_ShowMenu.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/largeOrxlage.dart';
import 'package:food_app/Widgets/listtile_widget.dart';
import 'package:food_app/Widgets/vdivider.dart';
import 'package:food_app/contant/constant.dart';
import 'package:food_app/models/CartItem.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class SandwichScreen extends StatefulWidget {
  const SandwichScreen({Key? key}) : super(key: key);
  static const roteName = '/SandwichScreen';

  @override
  _SandwichScreenState createState() => _SandwichScreenState();
}

class _SandwichScreenState extends State<SandwichScreen> {
  Map ProductInfo = {};
  int quantity = 0;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    String offerInfoString =
        jsonEncode(ModalRoute.of(context)!.settings.arguments);
    setState(() {
      ProductInfo = jsonDecode(offerInfoString);
      quantity = ProductInfo["quantity"];
    });
  }

  // int _quantity = 0;
  // bool? _checked = true;
  // bool? _checked1 = false;
  @override
  void initState() {
    super.initState();
    if (ProductInfo['large'] == ProductInfo['xlarge']) {
      ProductInfo['large'] != ProductInfo['xlarge'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_ShowMenu(
        imageName: ProductInfo["name"],
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
                    "    Size".tr,
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
                      color: ProductInfo['xlarge']!
                          ? Colors.blue.shade50
                          : Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        "+2.00    اكس لارج",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      dense: true,
                      value: ProductInfo['xlarge'],
                      onChanged: (value) {
                        setState(
                          () {
                            if (value == true) {
                              ProductInfo['xlarge'] = value;
                              ProductInfo['large'] = false;
                            }
                          },
                        );
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
                      color: ProductInfo['large']!
                          ? Colors.blue.shade50
                          : Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        " لارج",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      dense: true,
                      value: ProductInfo['large'],
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            ProductInfo['large'] = value;
                            ProductInfo['xlarge'] = false;
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
                    "   Special Instructions".tr,
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
                    "   Quantity".tr,
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
                      quantity.toString(),
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
            child: Button_Widget("Add to cart".tr,
                MediaQuery.of(context).size.width, 75, Colors.orange, () {
              context.read<CartItem>().addCartItem(ProductInfo , quantity);
              //            Navigator.pushNamed(context, Cartshopscreen.roteName,
              //            );
            }),
          ),
        ],
      ),
    );
  }

  subtract() {
    setState(() {
      if (ProductInfo['quantity'] > 0) {
        quantity--;
      }
    });
  }

  add() {
    setState(() {
      quantity++;
    });
  }
}
