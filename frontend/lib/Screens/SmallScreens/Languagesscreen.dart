import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/FirstPageScreen.dart';
import 'package:food_app/Widgets/languagewidget.dart';
import 'package:food_app/Widgets/listtile_widget_languages.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  static const roteName = '/Languanges';

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  //bool value = true;
  bool? _checked = true;
  bool? _checked1 = false;
  @override
  void initState() {
    super.initState();
    if (_checked == _checked1) {
      _checked != _checked1;
    }
  }

  Widget buildChckbox() => Checkbox(
      value: _checked,
      onChanged: (value) {
        setState(() {
          if (value == true) {
            _checked = value;
            _checked1 = false;
          }
        });
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Languages",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        shape: const Border(bottom: BorderSide(color: Colors.red, width: 2)),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          InkWell(
            child: ListTile(
              leading: Text(
                "English",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              // trailing:Checkbox(

              //         value: _checked ,
              //         onChanged: (value) {

              //           setState(() {
              //             if (value == true) {
              //               _checked  = value;
              //               _checked1 = false;
              //             }
              //           });
              //         },
              //         activeColor: Colors.green,
              //       ),
              onTap: () {
                var local = Locale('en', "US");
                Get.updateLocale(local);
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => FirstPageScreen(),
                  ),
                );
              },
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          InkWell(
            child: ListTile(
              leading: Text(
                "عربي",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              // trailing:Checkbox(

              //         value: _checked1 ,
              //         onChanged: (value) {

              //           setState(() {
              //             if (value == true) {
              //               _checked1  = value;
              //               _checked = false;
              //             }
              //           });
              //         },
              //         activeColor: Colors.green,
              //       ),
              onTap: () {
                var local = Locale('ar', "AR");
                Get.updateLocale(local);
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => FirstPageScreen(),
                  ),
                );
              },
            ),
          ),
          LanguageWidget(),
        ],
      ),
    );
  }
}
