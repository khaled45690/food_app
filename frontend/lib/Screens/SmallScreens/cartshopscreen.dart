import 'package:flutter/material.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/vdivider.dart';

class Cartshopscreen extends StatefulWidget {
  static const roteName = '/CartShop';

  @override
  _CartshopscreenState createState() => _CartshopscreenState();
}

class _CartshopscreenState extends State<Cartshopscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        // actions: <Widget>[
        //   Row(
        //     children: [
                   
          
            
        //     ],
        //   ),
        // ],
        title:    Text(
              "خواطر دمشقيه",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cart is empty",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),

                  
                  ),
                ],
              ),
              SizedBox(height: 35,),
              Divider(
                color: Colors.black,
              ),
                            SizedBox(height: 35,),

              ListTile(
                leading: Text("Sub-Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                trailing: Text("0.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              ),
               ListTile(
                leading: Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                trailing: Text("0.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              ),

            ],
          ),
          Positioned(
                    bottom:0,
                    child: Button_Widget("BUY NOW",392,75,Colors.orange,(){}),
                    
                    ),
        ],
      ),
      
    );
  }
}