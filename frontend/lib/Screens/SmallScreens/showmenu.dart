import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/AppBar_ShowMenu.dart';
import 'package:food_app/Widgets/OfferFataWidget.dart';
import 'package:food_app/Widgets/OfferMariaWidget.dart';
import 'package:food_app/Widgets/OfferShwrmaWidget.dart';
import 'package:food_app/Widgets/loadingspinner.dart';
import 'package:food_app/Widgets/meal_widget.dart';
import 'package:food_app/Widgets/showpicOfmenu.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowMenu extends StatefulWidget {
  const ShowMenu({Key? key}) : super(key: key);
  static const roteName = '/ShowMenur';

  @override
  _ShowMenuState createState() => _ShowMenuState();
}

class _ShowMenuState extends State<ShowMenu> {
  bool iSshawrma = true;
  bool iSmaria = true;
  bool iSfta = true;
  List productsList = [];
  List offersList = [];
  getProduct() async {
    var url = Uri.parse('${serverURL}products');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      setState(() {
        productsList = jsonObj['result'];
      });
    }
  }

  getOffers() async {
    var url = Uri.parse('${serverURL}offer');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      setState(() {
        offersList = jsonObj['result'];
        //    print(offersList);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getProduct();
    getOffers();
  }

//bool loading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_ShowMenu(),
      body: ListView(
        children: <Widget>[
          ShowPicOfMenu(),
          SizedBox(
            height: 20,
          ),
          productsList.length == 0
              ? SpinnerLoading()
              : Column(
                  children: [
                    for (int i = 0; i < offersList.length; i++)
                      MealWidget(offersList[i]),
                      // for (int p = 0; p < productsList.length; p++)
                      //                OfferDetailsWidget(productsList[p]),
                 
                    iSshawrma
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                iSshawrma = !iSshawrma;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 15,bottom: 10),
                                            child: Text("سناندوتش الشاورما",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                              margin: EdgeInsets.only(),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.arrow_drop_up,
                                                    size: 35,
                                                  )))
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () {
                             
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 1,
                                width: MediaQuery.of(context).size.width,
                                decoration:
                                    BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              9,
                                      decoration:
                                          BoxDecoration(color: Colors.grey),
                                      child: InkWell(
                                        onTap: (){
                                           setState(() {
                                iSshawrma = !iSshawrma;
                              });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                        Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15,bottom: 10),
                                              child: Text("سناندوتش الشاورما",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                            Spacer(
                                            ),
                                            Container(
                                                child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                size: 35,
                                              ),
                                            ),
                                            ),
                                          ],
                                          
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context).size.height/5,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage("assets/images/shawrma.jpg"))
                                            ),
                                          ),
                                           for (int p = 0; p < productsList.length; p++)
                                     OfferShwrmaWidget(productsList[p]),
                                             
                                        ],
                                      ))
                                  ],
                                )
                       

                                ),
                          ),





















                           iSmaria
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                iSmaria = !iSmaria;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 15,bottom: 10),
                                            child: Text("ماريا شاورما جديد",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                              margin: EdgeInsets.only(),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.arrow_drop_up,
                                                    size: 35,
                                                  )))
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () {
                             
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 1,
                                width: MediaQuery.of(context).size.width,
                                decoration:
                                    BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              9,
                                      decoration:
                                          BoxDecoration(color: Colors.grey),
                                      child: InkWell(
                                        onTap: (){
                                           setState(() {
                                iSmaria = !iSmaria;
                              });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                        Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15,bottom: 10),
                                              child: Text("ماريا شاورما جديد",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                            Spacer(
                                            ),
                                            Container(
                                                child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                size: 35,
                                              ),
                                            ),
                                            ),
                                          ],
                                          
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context).size.height/5,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage("assets/images/maria.jpg"))
                                            ),
                                          ),
                                           for (int p = 0; p < productsList.length; p++)
                                     OfferMariaWidget(productsList[p]),
                                             
                                        ],
                                      ))
                                  ],
                                )
                       

                                ),
                          ),






















                            iSfta
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                iSfta = !iSfta;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 15,bottom: 10),
                                            child: Text("فتات",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                              margin: EdgeInsets.only(),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.arrow_drop_up,
                                                    size: 35,
                                                  )))
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () {
                             
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 1,
                                width: MediaQuery.of(context).size.width,
                                decoration:
                                    BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              9,
                                      decoration:
                                          BoxDecoration(color: Colors.grey),
                                      child: InkWell(
                                        onTap: (){
                                           setState(() {
                                iSfta = !iSfta;
                              });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                        Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15,bottom: 10),
                                              child: Text("فتات",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                            Spacer(
                                            ),
                                            Container(
                                                child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                size: 35,
                                              ),
                                            ),
                                            ),
                                          ],
                                          
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context).size.height/5,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage("assets/images/fata.jpg"))
                                            ),
                                          ),
                                           for (int p = 0; p < productsList.length; p++)
                                     OfferFataWidget(productsList[p]),
                                             
                                        ],
                                      ))
                                  ],
                                )
                       

                                ),
                          )
                  ],
                )
        ],
      ),
    );
  }
}
