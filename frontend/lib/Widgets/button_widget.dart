import 'package:flutter/material.dart';



class Button_Widget extends StatelessWidget {
final String text;
Button_Widget(this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
                        children: <Widget>[
                          Container(
                            height: 75,
                            width: 392,
                            child: FlatButton(
                          onPressed: () {},
                          child: Text(text,style: TextStyle(fontSize: 20,color: Colors.white),),
                          color: Colors.orange,
                            ),
                          )
                        ],
                      );
  }
}