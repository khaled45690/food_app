import 'package:flutter/material.dart';


class Listtile_widet extends StatelessWidget {
  final String nameOfFood;
  final String price;
Listtile_widet(this.nameOfFood,this.price);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
            child: ListTile(
              title: Text(nameOfFood,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              leading:CircleAvatar(
                
              ),
              trailing: Text(price,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          );
  }
}