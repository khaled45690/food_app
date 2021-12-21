import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/SignUpScreen.dart';
import 'package:food_app/Screens/MainScreens/welcomescreen.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/buttonWidget.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/textformfieldWidget.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();

  final TextEditingController _pass = TextEditingController();
  static const routename = '/Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb74093),
      body: Form(
        key: _key,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 170,
              ),
              Text(
                "خواطر دمشقيه",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextFormFieldWidget(
                      _email, "Enter your email", Icon(Icons.email), (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  }, false)),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextFormFieldWidget(
                      _pass, "Enter your password", Icon(Icons.lock), (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'pleasw enter strong password';
                    }
                    return null;
                  }, true)),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 8,
                  child: ButtonWidget('Login', () {
                    if(_key.currentState!.validate()){
                          Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => WellcomeScreen(),
                          ),
                        );
                    }

                  })),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => SingUp(),
                          ),
                        );
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
