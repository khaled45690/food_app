// ignore_for_file: file_names
// ignore: file_names
// ignore: file_names
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Widgets/drawer_menuu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// var myMarkers = HashSet<Marker>(); //collection
class FirstPageSmallScreen extends StatelessWidget {
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
        //    leading: Icon(Icons.three_k_plus_outlined,color: Colors.grey,),

        title: const Text(
          "data",
        ),
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
      ]),
    );
  }
}
