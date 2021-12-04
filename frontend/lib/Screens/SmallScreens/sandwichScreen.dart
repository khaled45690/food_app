import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Widgets/largeOrxlage.dart';
import 'package:food_app/Widgets/listtile_widget.dart';
import 'package:food_app/Widgets/vdivider.dart';

class SandwichScreen extends StatefulWidget {
  const SandwichScreen({Key? key}) : super(key: key);
  static const roteName = '/SandwichScreen';

  @override
  _SandwichScreenState createState() => _SandwichScreenState();
}

class _SandwichScreenState extends State<SandwichScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.white54,
        shadowColor: Colors.white54,
   
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                    Navigator.push(context, new MaterialPageRoute(
                               builder:(context)=>Cartshopscreen(),
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
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/krs.jpg"),
                )),
              ),
              SizedBox(height: 35,),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height/7,
              // decoration: BoxDecoration(
              //   color: Colors.white,
                 
               
              //   ),
            
                
                  
                    SizedBox(
                      height:150
                    ),
                      InkWell(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red
                         ),
                        child: ListTile(



                        ),

                        
                    
                      ),
                    ),
                    

              
            ],
          ),
        ],
      ),
    );
  }
}
