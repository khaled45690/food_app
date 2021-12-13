import 'package:flutter/material.dart';

class Textfieldaddres extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  ValueChanged<String>? onChanged;
  Textfieldaddres(this.controller, this.labelText, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter your name';
            }
            if (value.length < 10) {
              return 'Should be at  least 10 characters long';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText:
                //streetNamme.text
                //==null ?
                labelText,
            // : notesController.text

            isDense: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 5)),
            prefixIcon: Icon(Icons.streetview_sharp),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow, width: 5),
            ),
          ),
          onChanged: onChanged),
    );
  }
}
