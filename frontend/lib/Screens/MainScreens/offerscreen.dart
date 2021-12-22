import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Screens/MainScreens/widgetsformainScreen.dart/productsWidget.dart';
import 'package:food_app/Widgets/meal_widget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:http/http.dart' as http;


class OfferScreen extends StatefulWidget {
  static const roteName = '/offerscreen';

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {


  List offersList = [];

deleteOffer(String id)async{
        final http.Response response = await http.delete(
    Uri.parse('${serverURL}offer/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

return response;
 



}
  getOffers() async {
    var url = Uri.parse('${serverURL}offer');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      setState(() {
        offersList = jsonObj['result'];
      });
    }
  }

   deleteoffer(String id) async { 
    var response = await http.delete(Uri.parse('${serverURL}offer/$id'));
    return response;

   }

  @override
  void initState() {
    super.initState();
    getOffers();
    print(offersList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //        Text("data"),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(top: 10, left: 15, bottom: 10),
                          child: Text("NameOfOffer",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 13),
                          child: Text(
                            "price",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          for (int i = 0; i < offersList.length; i++) 
          ListTile(
          title: Text(offersList[i]['offername']),
             leading: Text(offersList[i]['description']),
          //  trailing: Text(offersList[i]['offerprice'].toString()),
          trailing: IconButton(onPressed: (){
            deleteOffer(offersList[i]['id']);
          }, icon: Icon(Icons.close)),


          )
        ],
      ),
    );
  }
}
