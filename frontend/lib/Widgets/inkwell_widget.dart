import 'package:flutter/material.dart';

class Inkwekk extends StatelessWidget {
   final String name ;
  final double sizeOfIcon,fontSize;
  final IconData iconn;
 final GestureTapCallback navigator;
  const Inkwekk(this.name,this.fontSize,this.sizeOfIcon,this.iconn,this.navigator);

  @override
  Widget build(BuildContext context) {
    return                       InkWell(
      onTap: navigator,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Padding(
                               padding: EdgeInsets.all(8.0),
                               child: Icon(iconn,size: sizeOfIcon,color: Colors.white),
                             ),
                             SizedBox(
                               height: 40,
                               width: 10,
                             ),
                             Text(name,style: TextStyle(fontSize: fontSize,color: Colors.white,fontWeight: FontWeight.w100),)
                           ],
                         ),
                       );

  }
}