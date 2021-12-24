import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/Screens/MainScreens/SignUpScreen.dart';
import 'package:food_app/Screens/MainScreens/offerscreen.dart';
import 'package:food_app/Screens/MainScreens/welcomescreen.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/buttonWidget.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/textformfieldWidget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class addoffer extends StatefulWidget {
  static const routename = '/addoffer';

  @override
  State<addoffer> createState() => _addofferState();
}

class _addofferState extends State<addoffer> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController offername = TextEditingController();

  final TextEditingController offerprice = TextEditingController();

  final TextEditingController description = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File? image;

  Future pickimage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
   image.readAsBytes().then((value) =>  uploadImage(value, "name"));


      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("faild to pick image:$e");
    }
  }

  postoffer() async {
    var response = await http.post(Uri.parse('${serverURL}offer'), body: {
      "imagename": "shawrma.jpg",
      "offername": offername.text,
      "offerprice": offerprice.text,
      "description": description.text
    });
    return response;
  }

  uploadImage(image , name)async{
    // print(image);
    Uri uri =
    Uri.parse("${serverURL}image");
    print(uri);
    http.MultipartRequest request = http.MultipartRequest("POST", uri);
    List<int> imageData = image;
    print(imageData.length);
    http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
      'File',
      imageData,
      filename: name,
    );
    request.files.add(multipartFile);
// send
    http.StreamedResponse response = await request.send();

    return response;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb74093),
      body: Form(
        key: _key,
        child: Center(
          child: SingleChildScrollView(
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
                  height: 120,
                ),
                image != null
                    ? Container(
                      width: 100,
                      height: 10,
                    )
                    : Container(
                        width: 160,
                        height: 160,
                        child: Text("no image uploaded")),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(56),
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          textStyle: TextStyle(fontSize: 20)),
                      onPressed: () {
                        pickimage();
                      },
                      child: Row(
                        children: [Icon(Icons.picture_in_picture)],
                      )),
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 8,
                    child: ButtonWidget('upload', () {
                      if (_key.currentState!.validate()) {
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
      ),
    );
  }
}
