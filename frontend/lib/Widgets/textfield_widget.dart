import 'package:flutter/material.dart';

class TextField_Widget extends StatelessWidget {
final String textt;
final IconData iconn;
final double width;
TextField_Widget(this.textt,this.iconn,this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
                           // color: Colors.amber,
                            width: width,
                            child:  TextField(
                              decoration: InputDecoration(
                                  labelText: textt,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey, width: 5)),
                                  prefixIcon: Icon(iconn),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.yellow, width: 5))),
                            ),
                          );
  }
}