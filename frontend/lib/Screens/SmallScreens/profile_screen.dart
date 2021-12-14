import 'dart:core';

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/textfield_widget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:food_app/models/UserData.dart';
import 'package:provider/src/provider.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const roteName = '/ProfileScreene';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map data = {
    "firstName": null,
    "lastName": null,
    "email": null,
    "telephone": null,
  };
  onChange(value, variableName) {
    setState(() {
      data[variableName] = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserData>().getUserData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      data = context.watch<UserData>().userData;
    });
  }

  postDateProfile() async {
    var response = await http.post(Uri.parse('${serverURL}contacts'), body: {
      "firstname": firstnameController.text,
      "lastname": lastnameController.text,
      "phone": phoneController.text,
      "email": emailController.text
    });
    print(response.body);
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                            TextField_Widget(
                                data["firstName"] == null
                                    ? "Fist Name*".tr
                                    : data["firstName"],
                                Icons.person,
                                MediaQuery.of(context).size.width / 2.3,
                                 (firstName) =>
                            setState(() => onChange(firstName, "firstName"))
                                
                                , firstnameController),
                            Container(
                              // color: Colors.amber,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: TextFormField(
                                controller: lastnameController,
                            onChanged:(lastName) =>
                            setState(() => onChange(lastName, "lastName")) ,
                                decoration: InputDecoration(
                                    labelText: data["lastName"] == null
                                        ? "Last Name*".tr
                                        : data["lastName"],
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
                        TextField_Widget(
                            data["email"] == null
                                ? "E-mail*".tr
                                : data["email"],
                            Icons.email,
                            MediaQuery.of(context).size.width / 1.15, 
                               (email) =>
                            setState(() => onChange(email, "email"))
                            , emailController
                            
                            ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField_Widget(
                            data["telephone"] == null
                                ? "Telephone*".tr
                                : data["telephone"],
                            Icons.phone,
                            MediaQuery.of(context).size.width / 1.15,
                                   (telephone) =>
                            setState(() => onChange(telephone, "telephone"))
                            , phoneController),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Button_Widget("Save".tr,
                    MediaQuery.of(context).size.width, 75, Colors.orange, () {
                  context.read<UserData>().setUserDataFunc(data);
                  postDateProfile();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
