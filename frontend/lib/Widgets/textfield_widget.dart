import 'package:flutter/material.dart';

class TextField_Widget extends StatelessWidget {
  final String textt;
  final IconData iconn;
  final double width;
   ValueChanged<String>? onChanged;
  TextEditingController textEditingController;

  TextField_Widget(this.textt, this.iconn, this.width, this.onChanged,
      this.textEditingController);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: width,
      child: TextFormField(
        controller: textEditingController,
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: textt,
            isDense: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 5)),
            prefixIcon: Icon(iconn),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 5))),
      ),
    );
  }
}
