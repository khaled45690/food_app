import 'package:flutter/material.dart';

class Listtile_widet extends StatefulWidget {
  final String nameOfFood;
  final String price;
  final GestureTapCallback gestureDetector;

  Listtile_widet(this.nameOfFood, this.price, this.gestureDetector);

  @override
  State<Listtile_widet> createState() => _Listtile_widetState();
}

class _Listtile_widetState extends State<Listtile_widet> {
  bool value = false;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.gestureDetector,
      child: ListTile(
        title: Text(
          widget.nameOfFood,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
       // leading: buildChckbox(),
        trailing: Text(
          widget.price,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
