import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/SignUpScreen.dart';
import 'package:food_app/Screens/MainScreens/offerscreen.dart';
import 'package:food_app/Screens/MainScreens/welcomescreen.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/buttonWidget.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/textformfieldWidget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class addoffer extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController offername = TextEditingController();

  final TextEditingController offerprice = TextEditingController();
    final TextEditingController description = TextEditingController();
      final ImagePicker _picker = ImagePicker();


  static const routename = '/addoffer';


  
    postoffer() async { 
    var response = await http.post(Uri.parse('${serverURL}offer'), body: {
      "imagename": "shawrma.jpg",
      "offername": offername.text,
      "offerprice": offerprice.text,
      "description": description.text
    });
    return response;  

   }
   
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
                      offername, "offername", Icon(Icons.email), (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the offername';
                    }
                    return null;
                  }, false)),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextFormFieldWidget(
                      offerprice, "offerprice", Icon(Icons.lock), (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price';
                    }
                 
                    return null;
                  }, false)),
                    SizedBox(
                height: 10,
              ),
                      Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextFormFieldWidget(
                      description, "description", Icon(Icons.lock), (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the description';
                    }
                 
                    return null;
                  }, false)),
                   
              SizedBox(
                height: 20,
              ),
              Container(
          width: MediaQuery.of(context).size.width / 6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(56),
                    primary:Colors.white,
                    onPrimary: Colors.black,
                    textStyle: TextStyle(fontSize: 20)
                  ),
                  onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.picture_in_picture)
                  ],
                )),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 8,
                  child: ButtonWidget('upload', () {
                    if(_key.currentState!.validate()){
                      postoffer();
                          Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => OfferScreen(),
                          ),
                        );
                    }

                  })),
       
            ],
          ),
        ),
      ),
    );
  }
}
