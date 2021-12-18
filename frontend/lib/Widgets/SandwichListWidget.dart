import 'package:flutter/material.dart';

import 'OfferShwrmaWidget.dart';

class SandwichListWidget extends StatelessWidget {
  final Function sandwichTypeOnChange;
  final String sandwichType, text;
  final List productList;
  const SandwichListWidget(
      this.sandwichTypeOnChange, this.sandwichType, this.text ,this.productList);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 9,
                decoration: BoxDecoration(color: Colors.grey),
                child: InkWell(
                  onTap: () => sandwichTypeOnChange(sandwichType),
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
                  decoration: BoxDecoration(color: Colors.grey),
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
          )),
    );
  }
}
