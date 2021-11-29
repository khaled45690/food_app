// ignore_for_file: file_names
// ignore: file_names
// ignore: file_names
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Screens/SmallScreens/showmenu.dart';
import 'package:food_app/Widgets/button_widget.dart';
import 'package:food_app/Widgets/drawer_menuu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// var myMarkers = HashSet<Marker>(); //collection
class FirstPageSmallScreen extends StatelessWidget {
  //static String routename ='/FirstPagee';
  final HashSet<Marker> myMarkers;
  final Function onMapCreated;
  const FirstPageSmallScreen(this.myMarkers, this.onMapCreated);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      drawer: const Drawer_Widget(),
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: LatLng(31.2001, 29.9187), zoom: 15),
          onMapCreated: (GoogleMapController googleMapController) =>
              onMapCreated(googleMapController),
          markers: myMarkers,
        ),
        Positioned(
          bottom: 20,
          child: Row(
            children: [
              Container(
                height: 230,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/krs.jpg"),
                    )),
                margin: EdgeInsets.fromLTRB(45, 8, 8, 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 190,
                    ),
                    Row(
                      children: [
                        // Text("data"),
                        Button_Widget(
                          "See Menu&Order",
                          300,
                          40,
                          Colors.grey,
                          () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => ShowMenu(),
                              ),
                            );
                          },
                        ),

                        //   Button_Widget("Get it now",173,40,Colors.orange)
                      ],
                    ),
                  ],
                ),
                //margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
              )
            ],
          ),
        )
      ]),
    );
  }
}
