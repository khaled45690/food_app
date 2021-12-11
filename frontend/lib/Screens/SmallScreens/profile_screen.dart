import 'package:flutter/material.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/textfield_widget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:food_app/models/UserData.dart';
import 'package:provider/src/provider.dart';
import 'package:http/http.dart' as http;


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const roteName = '/ProfileScreene';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map userData = {};
  Map data = {
    "firstName": null,
    "lastName": null,
    "email": null,
    "telephone": null,
  };
  onChange(value, String variableName) {
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
      userData = context.watch<UserData>().userData;
    });
  }
  postDateProfile()async{
  var response = await http.post(Uri.parse('${serverURL}contacts'),
  body: {
  "firstname":firstnameController.text,
    "lastname": lastnameController.text,
    "phone": phoneController.text,
    "email" : emailController.text

  }
  );
  print(response.body);

}
  TextEditingController firstnameController =TextEditingController();
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
                              
                              userData["firstName"] == null
                                  ? "Fist Name*"
                                  : userData["firstName"],
                              Icons.person,
                              MediaQuery.of(context).size.width / 2.3,
                              (value) {
                                onChange(value, "firstName");
                                if (value!.isEmpty) {
                                  return 'please enter your name';
                                }
                                if (value.length < 10) {
                                  return 'Should be at  least 10 characters long';
                                }
                                return null;
                              },
                              firstnameController
                            ),
                            Container(
                              // color: Colors.amber,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: TextFormField(
                                controller: lastnameController,
                                validator: (value) {
                                  onChange(value, "lastName");
                                  if (value!.isEmpty) {
                                    return 'please enter your name';
                                  }
                                  if (value.length < 10) {
                                    return 'Should be at  least 10 characters long';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: userData["lastName"] == null
                                        ? "Last Name*"
                                        : userData["lastName"],
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
                          userData["email"] == null
                              ? "E-mail*"
                              : userData["email"],
                          Icons.email,
                          MediaQuery.of(context).size.width / 1.15,
                          (value) {
                            onChange(value, "email");
                            if (value!.isEmpty) {
                              return 'please enter your Email';
                            }

                            return null;
                          },
                          emailController
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField_Widget(
                          userData["telephone"] == null
                              ? "Telephone*"
                              : userData["telephone"],
                          Icons.phone,
                          MediaQuery.of(context).size.width / 1.15,
                          (value) {
                            onChange(value, "telephone");
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
                          phoneController
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Button_Widget("Save", MediaQuery.of(context).size.width,
                    75, Colors.orange, () {
                  
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
