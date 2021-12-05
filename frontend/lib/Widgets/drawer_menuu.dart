import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/FirstPageScreen.dart';
import 'package:food_app/Screens/SmallScreens/AboutScreen.dart';
import 'package:food_app/Screens/SmallScreens/Languagesscreen.dart';
import 'package:food_app/Screens/SmallScreens/addresses_screen.dart';
import 'package:food_app/Screens/SmallScreens/privacy_screen.dart';
import 'package:food_app/Screens/SmallScreens/profile_screen.dart';
import 'package:food_app/Screens/SmallScreens/terms_screen.dart';
import 'package:food_app/Widgets/divider.dart';
import 'package:food_app/Widgets/inkwell_widget.dart';

// ignore: camel_case_types
class Drawer_Widget extends StatefulWidget {
  const Drawer_Widget({Key? key}) : super(key: key);

  @override
  _Drawer_WidgetState createState() => _Drawer_WidgetState();
}

// ignore: camel_case_types
class _Drawer_WidgetState extends State<Drawer_Widget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 330,
            color: Color(0xff313943),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                  width: 100,
                ),
                Container(
                    height: 95,
                    width: 100,
                    child: Image.asset('assets/images/nkhw.png')),
                const SizedBox(
                  height: 10,
                  width: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Dividerr(),
                Inkwekk("Home", 24, 24, Icons.home, () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => FirstPageScreen(),
                    ),
                  );
                }),
                const Dividerr(),
                Inkwekk("Profile", 24, 24, Icons.person, () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                }),
                const Dividerr(),
                Inkwekk("Addresses", 24, 24, Icons.location_on_rounded, () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Addresses_screen(),
                    ),
                  );
                }),
                const Dividerr(),
              ],
            ),
          ),
          Container(
            height: 420,
            color: Color(0xff2d343e),
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "OTHER",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                Inkwekk("Language", 24, 24, Icons.language, () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => LanguageScreen(),
                    ),
                  );
                }
                ),
                Inkwekk("Terms", 24, 24, Icons.border_inner_outlined, () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Terms_screen(),
                    ),
                  );
                }),
                Inkwekk("Privacy", 24, 24, Icons.lock_outline_rounded, () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Privacy_screen(),
                    ),
                  );
                }),
                Inkwekk("About", 24, 24, Icons.info_outline, () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
