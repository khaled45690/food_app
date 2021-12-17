import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/textfield_widget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:food_app/models/UserData.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/src/provider.dart';
import 'package:http/http.dart' as http;

import 'button_widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({ Key? key }) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Map? sharedPrefrenceCheck;
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
    sharedPrefrenceCheck = context.read<UserData>().userData;
    context.read<UserData>().getUserData();
    print(context.read<UserData>().userData);
    //print(sharedPrefrenceCheck);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      // data = context.watch<UserData>().userData;
    });
  }

  postDateProfile() async {
    var response = await http.post(Uri.parse('${serverURL}contacts'), body: {
      "firstname": firstnameController.text,
      "lastname": lastnameController.text,
      "phone": phoneController.text,
      "email": emailController.text
    });
    Map jsonBody = jsonDecode(response.body);
    Map userData = {
      "id": jsonBody["id"],
      "firstname": jsonBody["firstname"],
      "lastname": jsonBody["lastname"],
      "email": jsonBody["email"],
      "phone": jsonBody["phone"],
    };
    userData["id"];
    context.read<UserData>().setUserDataFunc(userData);
  }

  updatDateProfile() async {
    var response = await http.put(Uri.parse('${serverURL}contacts'), body: {
      "id": context.read<UserData>().userData!["id"],
      "firstname": firstnameController.text,
      "lastname": lastnameController.text,
      "phone": phoneController.text,
      "email": emailController.text
    });
    Map jsonBody = jsonDecode(response.body);
    Map userData = {
      "id": jsonBody["id"],
      "firstname": jsonBody["firstname"],
      "lastname": jsonBody["lastname"],
      "email": jsonBody["email"],
      "phone": jsonBody["phone"],
    };
    context.read<UserData>().setUserDataFunc(userData);
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                            "Fist Name*".tr,
                            Icons.person,
                            MediaQuery.of(context).size.width / 2.3,
                            (firstName) => setState(
                              () => onChange(firstName, "firstName"),
                            ),
                            firstnameController,
                            (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your firstname';
                              }
                              if (value.length < 3) {
                                return 'Username must be at least 3 characters in length';
                              }

                              return null;
                            },
                          ),
                          Container(
                            // color: Colors.amber,
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                if (value.length < 3) {
                                  return 'Username must be at least 3 characters in length';
                                }

                                return null;
                              },
                              controller: lastnameController,
                              onChanged: (lastName) => setState(
                                  () => onChange(lastName, "lastName")),
                              decoration: InputDecoration(
                                hintText: data["lastName"] == null
                                    ? "Last Name*".tr
                                    : data["lastName"],
                                labelText: "Last Name*".tr,

                                isDense: true,

                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 5),
                                ),

                                //  prefixIcon: Icon(Icons.person),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.yellow, width: 5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField_Widget(
                        data["email"] == null ? "E-mail*".tr : data["email"],
                        "E-mail*".tr,
                        Icons.email,
                        MediaQuery.of(context).size.width / 1.15,
                        (email) => setState(() => onChange(email, "email")),
                        emailController,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField_Widget(
                        data["telephone"] == null
                            ? "Telephone*".tr
                            : data["telephone"],
                        "Telephone*".tr,
                        Icons.phone,
                        MediaQuery.of(context).size.width / 1.15,
                        (telephone) =>
                            setState(() => onChange(telephone, "telephone")),
                        phoneController,
                        (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your telephone';
                          }
                          if (value.length != 11) {
                            return 'telephone must be at least 11 digit ';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Button_Widget("Save".tr, MediaQuery.of(context).size.width,
                  75, Colors.orange, () {
                if (_formKey.currentState!.validate()) {
                  if (context.read<UserData>().userData == null) {
                    postDateProfile();
                    context.read<UserData>().setUserDataFunc(data);
                    final snackBar = SnackBar(
                        content: Text(
                      "your information have been saved you can buy now",
                      style: TextStyle(fontSize: 14),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    updatDateProfile();
                    final snackBar = SnackBar(
                        content: Text(
                      "your information have been saved you can buy now",
                      style: TextStyle(fontSize: 14),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              }),
            ),
          ],
        ),
      );
  }
}