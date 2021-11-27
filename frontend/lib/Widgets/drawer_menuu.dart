import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/FirstPageScreen.dart';
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
                  height: 10,
                  width: 100,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 30, 10),
                  child: CircleAvatar(
                    
                   // backgroundColor: Colors.redAccent,
                    backgroundImage: AssetImage('assets/images/kkhw.jpg'),
                    radius: 32,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "خواطر دمشقيه",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Dividerr(),
                Inkwekk("Home", 24, 24, Icons.home, () {
                    Navigator.of(context)
                      .pushReplacementNamed(FirstPageScreen.roteName);
                }),
                const Dividerr(),
                Inkwekk("Profile", 24, 24, Icons.person, () {
                  Navigator.of(context)
                      .pushReplacementNamed(ProfileScreen.roteName);
                }),
                const Dividerr(),
                Inkwekk("Addresses", 24, 24, Icons.location_on_rounded, () {
                  Navigator.of(context)
                      .pushReplacementNamed(Addresses_screen.roteName);
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
                Inkwekk("Language", 24, 24, Icons.language, () {}),
                Inkwekk("Terms", 24, 24, Icons.border_inner_outlined, () {
                  Navigator.of(context)
                      .pushReplacementNamed(Terms_screen.roteName);
                }),
                Inkwekk("Privacy", 24, 24, Icons.lock_outline_rounded, () {
                  Navigator.of(context)
                      .pushReplacementNamed(Privacy_screen.roteName);
                }),
                Inkwekk("About", 24, 24, Icons.info_outline, () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
