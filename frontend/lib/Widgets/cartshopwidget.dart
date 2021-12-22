import 'package:flutter/material.dart';
import 'package:food_app/models/CartItem.dart';
import 'package:food_app/models/UserData.dart';
import 'package:provider/src/provider.dart';

class CartshopWidget extends StatelessWidget {
  int price = 0;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        for (int i = 0; i < context.read<CartItem>().cartList.length; i++)
              //  if (context.read<CartItem>().cartList[i]["xlarge"]==true)
              
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  ' ${context.watch<CartItem>().cartList[i]["quantity"]}'
                      .toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "X",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                        
                      
                  Container(
                    margin: EdgeInsets.only(right: 80),
                    child: Text(
                      context.watch<CartItem>().cartList[i]["name"] ?? '..',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 130),
                    
                      
                    child: Text(
                      context.watch<CartItem>().cartList[i]['xlarge'] == true ? "Size: اكس لارج" : "Size :لارج"
                    ))
                ],
              ),

              //   Text("data"),
              Spacer(),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        context.watch<CartItem>().cartList[i]['xlarge'] == true
                            ? Text(
                                "\ ${context.watch<CartItem>().cartList[i]['pricemax'] * context.watch<CartItem>().cartList[i]["quantity"]}.00"
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            : Text(
                                " ${context.watch<CartItem>().cartList[i]['price'] * context.watch<CartItem>().cartList[i]["quantity"]}.00"
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                        IconButton(
                            onPressed: () {
                              CartItem cartItem =
                                  Provider.of<CartItem>(context, listen: false);
                              cartItem.removeCartItem(
                                  context.read<CartItem>().cartList[i], false);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),iconSize: 20,),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
      ],
    );
  }
}
