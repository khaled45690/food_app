import 'package:flutter/material.dart';

class TextField_Widget extends StatelessWidget {
  final String textt;
    final String texttt;

  final IconData iconn;
  final double width;
  ValueChanged<String>? onChanged;
  TextEditingController textEditingController;
  FormFieldValidator<String> fieldValidator;


  TextField_Widget(this.textt, this.texttt,this.iconn, this.width, this.onChanged,
      this.textEditingController,this.fieldValidator);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: width,
      child: TextFormField(
        controller: textEditingController,
        onChanged: onChanged,
        validator: fieldValidator,
        decoration: InputDecoration(
          hintText: textt,
            labelText: texttt,
           //prefixText: "fdfdf",
           
        //   prefix: Icon(Icons.close),
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
