import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/FirstPageScreen.dart';
import 'package:food_app/Widgets/listtile_widget.dart';

class Listtile_widget_language extends StatelessWidget {
  final String Language;

  Listtile_widget_language(this.Language);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Text(
          Language,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => FirstPageScreen(),
            ),
          );
        },
      ),
    );
  }
}
