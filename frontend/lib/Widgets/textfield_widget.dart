import 'package:flutter/material.dart';

class TextField_Widget extends StatelessWidget {
  final String textt;
  final IconData iconn;
  final double width;
  FormFieldValidator<String>? validator;
  TextEditingController textEditingController;

  TextField_Widget(this.textt, this.iconn, this.width, this.validator,
      this.textEditingController);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: width,
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
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
