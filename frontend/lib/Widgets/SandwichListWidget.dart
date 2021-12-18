import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'OfferShwrmaWidget.dart';

class SandwichListWidget extends StatelessWidget {
  final Function sandwichTypeOnChange;
  final String isSandwichType , sandwichType, text;
  final List productList;
  const SandwichListWidget(
      this.sandwichTypeOnChange, this.isSandwichType, this.sandwichType, this.text ,this.productList);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isSandwichType == sandwichType ? MediaQuery.of(context).size.height / 1: 95,
      duration: Duration(milliseconds: 1000),
      child: Container(
          height:  isSandwichType == sandwichType ? MediaQuery.of(context).size.height / 1: 95,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:  isSandwichType == sandwichType ? MediaQuery.of(context).size.height / 9: 95,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: InkWell(
                      onTap: () => sandwichTypeOnChange(isSandwichType == sandwichType ? "" : isSandwichType),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                            child: Text(text,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Spacer(),
                          Container(
                              height : isSandwichType == sandwichType ? MediaQuery.of(context).size.height / 1: 0,
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
                  AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      decoration: BoxDecoration(color: Colors.grey),
                      height : isSandwichType == sandwichType ? MediaQuery.of(context).size.height /2: 0,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage("assets/images/shawrma.jpg"))),
                          ),
                          for (int p = 0; p < productList.length; p++)
                            OfferShwrmaWidget(productList[p]),
                        ],
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
