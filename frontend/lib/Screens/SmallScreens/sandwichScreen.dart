import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/cartshopscreen.dart';
import 'package:food_app/Widgets/button_widget.dart';
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
  int _quantity =0;
  bool? _checked = false;
  bool? _checked1 = false;
    @override
        void initState() {

    super.initState();
    if (_checked== _checked1)

    {
      _checked !=_checked1;
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
              // Container(
              //   height: MediaQuery.of(context).size.height / 3,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage("assets/images/krs.jpg"),
              //   )),
              // ),
              SizedBox(
                height: 35,
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
                      color: Colors.white54,
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
                            _checked1 = value;
                          });
                        
                      },
                      activeColor: Colors.green,
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
                      color: Colors.white54,
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
                            _checked = value;
                          });
                        
                      },
                      activeColor: Colors.green,
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
                children: [Text("   Quantity",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                                  
                  Container(
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width / 1.8,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                      isDense: true,
                      hintText: _quantity.toString(),
                      hintStyle:TextStyle(fontSize: 39, fontWeight: FontWeight.bold),
                      
                    )),
                  ),
                  InkWell(
                    onTap: subtract,
                    child: Container(
                        height: MediaQuery.of(context).size.height / 9,
                       width: MediaQuery.of(context).size.width /5,
                       decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.black),
                      ),
                      child: GestureDetector(
                        onTap: subtract,
                        child: SizedBox(
                          child: Icon(Icons.remove,size: 30,color: Colors.white,),
                          height: 28,
                          
                        )
                        
                      ),
                      
                  
                  
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 9,
                     width: MediaQuery.of(context).size.width /5,
                     decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                    ),

                    child: GestureDetector(
                      onTap: add,
                      child: SizedBox(
                        child: Icon(Icons.add,size: 30,color: Colors.white,),
                        height: 28,
                        
                      )
                      
                    ),

                  ),
              
                ],
              )
            ],
          ),
                 Positioned(
                bottom: 0,
                child: Button_Widget("Add to cart", MediaQuery.of(context).size.width,
                    75, Colors.orange, () {
               
                }),
              ),
        ],
      ),
    );
  }
  subtract(){
  setState(() {
    if(_quantity>0){
    _quantity --;
  }
  });
}
add(){
  setState(() {
    _quantity++;
  });
}
}

