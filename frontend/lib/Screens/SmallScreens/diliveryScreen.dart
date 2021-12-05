import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Widgets/vdivider.dart';

class DeliveryScreen extends StatefulWidget {
  static const roteName = '/DeliveryScreen';

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white54,
        shadowColor: Colors.white54,
        title:    Text(
              "خواطر دمشقيه",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
      ),
           body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(       
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.7,
                width: MediaQuery.of(context).size.width/1.1,
                color: Colors.red,
                
      
        ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.delivery_dining_sharp,size: 25,),),
              Text("Delivery Fees",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(
            color: Colors.black,
            indent: 4,
            endIndent: 5,
          ),
             Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("     Fee-EGP 20.00",style: TextStyle(fontSize: 17),),
            ],
          ),
          SizedBox(height: 55,),
                Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.watch_later_outlined,size: 26,),),
              Text("Opening Hours",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(
            color: Colors.black,
            indent: 4,
            endIndent: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Monday-Sunday",style: TextStyle(fontSize: 17),),
              Text("10.00 AM -02.00AM",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 55,),
                Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.badge,size: 26,),),
              Text("Pickup",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(
            color: Colors.black,
            indent: 4,
            endIndent: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Monday-Sunday",style: TextStyle(fontSize: 17),),
              Text("10.00 AM -02.00AM",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 55,),
                Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.payments,size: 26,),),
              Text("Payment Method",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(
            color: Colors.black,
            indent: 4,
            endIndent: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(" Cash  ",style: TextStyle(fontSize: 17),),
              Text("(Pickup,Delivery)",style: TextStyle(fontSize: 17),)
            ],
          ),
          SizedBox(height: 55,),
                Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.location_on_rounded,size: 26,),),
              Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(
            color: Colors.black,
            indent: 4,
            endIndent: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("شارع مسجد حاتم -سموحه- الاسكندريه",style: TextStyle(fontSize: 19),),
             // Text("10.00 AM -02.00AM",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 55,),
                Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.phone,size: 26,),),
              Text("Phone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(
            color: Colors.black,
            indent: 4,
            endIndent: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text("+201286996779",style: TextStyle(fontSize: 17),),
                  Text("+201286996779",style: TextStyle(fontSize: 17),),

                ],
              ),
            ],
            
          ),
          SizedBox(height: 20,)
        ],

        ),
        );
    
  }
}