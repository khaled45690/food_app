import 'package:flutter/material.dart';
import 'package:food_app/Widgets/button_widget.dart';

class Addresses_screen extends StatefulWidget {
  const Addresses_screen({Key? key}) : super(key: key);
    static const roteName ='/AddressScreen';


  @override
  _Addresses_screenState createState() => _Addresses_screenState();
}

class _Addresses_screenState extends State<Addresses_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                "Addresses",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            shape:
                const Border(bottom: BorderSide(color: Colors.red, width: 2)),
            backgroundColor: Colors.white,
          ),
          body: Form(
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                            "Add an addresse",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    // padding: EdgeInsets.fromLTRB(25, 35, 25, 35),
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                       // color: Colors.amber,
                        width: 350,
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: "Street name & number*",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 5)),
                              prefixIcon: Icon(Icons.person),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.yellow, width: 5))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: "Town or City Area*",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 5)),
                              prefixIcon: Icon(Icons.location_on_outlined),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.yellow, width: 5))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        child: const TextField(
                          decoration: InputDecoration(
                              labelText: "Postcode, Block,intercom where tp park*",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 5)),
                              prefixIcon: Icon(Icons.info),
                              disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.yellow, width: 5))),
                        ),
                      ),
                      SizedBox(
                        height: 300,
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
