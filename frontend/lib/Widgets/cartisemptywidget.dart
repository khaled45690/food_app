import 'package:flutter/material.dart';

class CartIsempty extends StatelessWidget {
  const CartIsempty({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Cart is empty",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),);
  }
}