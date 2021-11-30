import 'package:flutter/material.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/textfield_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const roteName = '/ProfileScreene';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
        final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            "My contact info",
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
                            TextField_Widget("Fist Name*", Icons.person, MediaQuery.of(context).size.width/2.3 ,
                             (value) {
                              if (value!.isEmpty) {
                                return 'please enter your name';
                              }
                              if (value.length < 10) {
                                return 'Should be at  least 10 characters long';
                              }
                              return null;
                            }, ),
                            Container(
                              // color: Colors.amber,
                              width: MediaQuery.of(context).size.width/2.3,
                              child:  TextFormField(
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
                                    labelText: "Last Name*",
                                    
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 5),
                                            ),
                                    //  prefixIcon: Icon(Icons.person),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.yellow, width: 5))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField_Widget("E-mail*", Icons.email,  MediaQuery.of(context).size.width/1.15, (value) {
                              if (value!.isEmpty) {
                                return 'please enter your Email';
                              }
                              
                              return null;
                            },),
                        SizedBox(
                          height: 15,
                        ),
                        TextField_Widget("Telephone*", Icons.phone, MediaQuery.of(context).size.width/1.15, 
                 (value) {
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
                            ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Button_Widget("Save", MediaQuery.of(context).size.width, 75, Colors.orange, () {
                   if(_formKey.currentState!.validate()){
                        return;
                      }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
