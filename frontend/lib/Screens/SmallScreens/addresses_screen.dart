import 'package:flutter/material.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addresses_screen extends StatefulWidget {
  static const roteName = '/AddressScreen';

  @override
  _Addresses_screenState createState() => _Addresses_screenState();
}

class _Addresses_screenState extends State<Addresses_screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String streetName = '';
  String town = '';
  String postcode = '';

  @override
  Widget build(BuildContext context) {
    final streetNameController = TextEditingController();
    final townController = TextEditingController();
    final postcodeController = TextEditingController();
    SharedPreferences localStorage;
    Future init() async {
      localStorage = await SharedPreferences.getInstance();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Addresses",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        shape: const Border(bottom: BorderSide(color: Colors.red, width: 2)),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Add an addresse",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
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
                        child: TextFormField(
                          controller: streetNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                            if (value.length < 10) {
                              return 'Should be at  least 10 characters long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText:
                                //streetNamme.text
                                //==null ?
                                "Street name & number*",
                            // : notesController.text

                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 5)),
                            prefixIcon: Icon(Icons.streetview_sharp),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellow, width: 5),
                            ),
                          ),
                          onChanged: (streetName) =>
                              setState(() => this.streetName == streetName),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          controller: townController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your town';
                            }
                            if (value.length < 10) {
                              return 'Should be at  least 10 characters long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Town or City Area*",
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 5)),
                            prefixIcon: Icon(Icons.location_on_outlined),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellow, width: 5),
                            ),
                          ),
                          onChanged: (town) =>
                              setState(() => this.town == town),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          controller: postcodeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter a number';
                            }
                            if (double.tryParse(value) == null) {
                              return 'please enter a valid number';
                            }
                            if (value.characters == 7) {
                              return 'non valid';
                            }
                          },
                          decoration: InputDecoration(
                            labelText:
                                "Postcode, Block,intercom where tp park*",
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 5)),
                            prefixIcon: Icon(Icons.info),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellow, width: 5),
                            ),
                          ),
                          onChanged: (postcode) =>
                              setState(() => this.postcode == postcode),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Button_Widget(
                  "Save", MediaQuery.of(context).size.width, 75, Colors.orange,
                  () {
                if (_formKey.currentState!.validate()) {
                  return;
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
