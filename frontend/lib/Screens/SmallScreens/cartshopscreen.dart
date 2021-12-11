import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/OfferDetailsWidget.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/vdivider.dart';
import 'package:food_app/models/CartItem.dart';
import 'package:provider/provider.dart';

class Cartshopscreen extends StatefulWidget {
  static const roteName = '/CartShop';

  @override
  _CartshopscreenState createState() => _CartshopscreenState();
}

class _CartshopscreenState extends State<Cartshopscreen> {
  List productList = [];
  Map productInfo = {};

    @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    String offerInfoString =
        jsonEncode(ModalRoute.of(context)!.settings.arguments);
    setState(() {
      productInfo = jsonDecode(offerInfoString);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    //       print(cartItem.cartList);
    setState(() {
      productList = cartItem.cartList;
    });
    print(productList);
  }
  
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(

        title: Text(
          "خواطر دمشقيه",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white54,
        shadowColor: Colors.white54,
      ),
   
            
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 35,
              ),
              context.watch<CartItem>().cartList.length == 0  ? Text("Cart is empty",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
                  :
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i = 0; i  < context.read<CartItem>().cartList.length ; i++)
                   Row(             
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [

                     Text(' ${context.watch<CartItem>().cartList[i]["quantity"]}\*'.toString() ,style: TextStyle(fontSize:22,fontWeight: FontWeight.bold ),),
                     Text(context.watch<CartItem>().cartList[i]["name"]??'..',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold ),),
                      
                       
                       
                    //   Text("data"),
                    Spacer(),
                       Column(
                         children: [
                           Row(
                             children: [
                         Text("\$ ${context.watch<CartItem>().cartList[i]['price']*context.watch<CartItem>().cartList[i]["quantity"]}".toString()   ,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

                               IconButton(onPressed: (){
                            CartItem cartItem = Provider.of<CartItem>(context , listen: false);
                            cartItem.removeCartItem(context.read<CartItem>().cartList[i]);

                               }, icon: Icon(Icons.close,color: Colors.red,)),
                             ],
                           ),
                         ],
                       )
                     
                     ]
                     ,

                   )

                     


                ],
              ),

              SizedBox(
                height: 35,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 35,
              ),
              ListTile(
                leading: Text(
                  "Sub-Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                
                trailing: Text("0.00",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              ListTile(
                leading: Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                trailing: Text("0.00",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            ],
          ),
          Positioned(
            bottom: 0,

            child:
            
             Row(
               children: [
                  for(int i = 0; i <= productList.length ; i++)
                 Button_Widget(
                  
productList.length == 0 ?  "Go to Checkout" :
                  "BUY NOW", 392, 75, Colors.orange, () {}),
               ],
             ),
          ),
        ],
      ),
    );
      
     

  }
  

}
