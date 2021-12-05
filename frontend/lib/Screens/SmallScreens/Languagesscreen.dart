import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/FirstPageScreen.dart';
import 'package:food_app/Widgets/listtile_widget_languages.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);
  static const roteName = '/Languanges';

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
    bool value = true;

  Widget buildChckbox() => Checkbox(
      value: value,
      onChanged: (value) {
          this.value = value!;
        
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
          Listtile_widget_language("Romana"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Catalan"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Espanol"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Slovenian"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
InkWell(
      child: ListTile(
        leading: Text(
          "English",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        trailing:buildChckbox() ,
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => FirstPageScreen(),
            ),
          );
        },
      ),
    ),          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Armenian"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("french"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("herbrew"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Italiano"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Albanian"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Arabic"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Espanol"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Icelandic"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Japanese"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Magyar"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Arabic"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("Nederland"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("polski"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
          Listtile_widget_language("portugues"),
          Divider(
            color: Colors.grey,
            height: 5,
            thickness: .8,
            indent: 5,
          ),
        ],
      ),
    );
  }
}
