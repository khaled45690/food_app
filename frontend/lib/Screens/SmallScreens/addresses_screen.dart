import 'package:flutter/material.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/textfieldaddresswidget.dart';
import 'package:food_app/contant/constant.dart';
import 'package:food_app/models/UserData.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Addresses_screen extends StatefulWidget {
  static const roteName = '/AddressScreen';

  @override
  _Addresses_screenState createState() => _Addresses_screenState();
}
class _Addresses_screenState extends State<Addresses_screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map data = {
    "streetName": null,
    "town": null,
    "postcode": null,
  };

  onChange(value, VariableName) {
    setState(() {
      data[VariableName] = value;

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserData>().getUserAddressData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      data = context.watch<UserData>().userAddressData;
    });
  }
postDateaddresses()async{
  var response = await http.post(Uri.parse('${serverURL}address'),
  body: {
  "streetName":streetnameController.text,
    "town": townController.text,
    "postcode": postcodeController.text,
  }
  );
  print(response.body);

}
TextEditingController streetnameController =TextEditingController();
TextEditingController townController = TextEditingController();
TextEditingController postcodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Addresses",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        shape: const Border(bottom: BorderSide(color: Colors.red, width: 2)),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Add an addresse",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Textfieldaddres(streetnameController,data["streetName"] == null
                                    ? "Street name & number*"
                                    : data["streetName"],(streetName) => setState(
                              () => onChange(streetName, "streetName")
                              ),),
                            SizedBox(
                        height: 15,
                      ),
                           Textfieldaddres(townController,
                           data["town"] == null ? "Town or City Area*" : data["town"],
                          (town) =>setState(() => onChange(town, "town")),
                              ),
                      
                      SizedBox(
                        height: 15,
                      ),
                       Textfieldaddres(postcodeController,
                           data["postcode"] == null
                                  ? "Postcode, Block,intercom where tp park*"
                                  : data["postcode"],
                            (postcode) => setState(() => onChange(postcode, "postcode"))
                              ),
                     
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Button_Widget(
                  "Save", MediaQuery.of(context).size.width, 75, Colors.orange,
                  () {
                context.read<UserData>().setUserAddressDataFunc(data);
                postDateaddresses();
                  
                
               
              }),
            ),
          ],
        ),
      ),
    );
  }
}
