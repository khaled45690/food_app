import 'package:flutter/material.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/textfield_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);
  static const roteName ='/ProfileScreene';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "My contact info",style: TextStyle(fontSize: 18,color: Colors.black),
              ),
          ),
          shape:const Border(bottom: BorderSide(color: Colors.red ,width: 2)),

            backgroundColor: Colors.white,)
            
            ,

            
        body: Form(
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
           
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    // padding: EdgeInsets.fromLTRB(25, 35, 25, 35),
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField_Widget("Fist Name*",Icons.person,175),
                          Container(
                           // color: Colors.amber,
                            width: 175,
                            child: const TextField(
                              decoration: InputDecoration(
                                  labelText: "Last Name*",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey, width: 5)),
                                //  prefixIcon: Icon(Icons.person),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.yellow, width: 5))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField_Widget("E-mail*",Icons.email,350),
                      
                      SizedBox(
                        height: 15,
                      ),
                    TextField_Widget("Telephone*",Icons.phone,350),
                      
                      SizedBox(
                        height: 345,
                      ),
                      Button_Widget("Continue"),
                    ],
                  ),
                ),
              ],
            ),
          ),


        
      ),

      
        
      );
    
  }
}