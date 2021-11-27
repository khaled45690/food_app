<<<<<<< Updated upstream
// ignore_for_file: file_names
=======
// ignore: file_names
import 'dart:collection';
>>>>>>> Stashed changes

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/drawer_menuu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class FirstPageSmallScreen extends StatefulWidget {
  const FirstPageSmallScreen({ Key? key }) : super(key: key);
  static const routename = '/FirstPageScreen';


  @override
  State<FirstPageSmallScreen> createState() => _FirstPageSmallScreenState();
}

class _FirstPageSmallScreenState extends State<FirstPageSmallScreen> {
  var myMarkers = HashSet<Marker>(); //collection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
    //    leading: Icon(Icons.three_k_plus_outlined,color: Colors.grey,),
<<<<<<< Updated upstream

        title: const Text("data",),
        centerTitle: true,
        
      ),
      drawer: const Drawer_Widget(),
=======
shadowColor: Colors.transparent,
        //title: Text("data",),
        centerTitle: true,
        
      ),
      drawer: Drawer_Widget(),
      body: Stack(
        children:[ GoogleMap(initialCameraPosition: CameraPosition(
          target: LatLng(31.2001, 29.9187),
          zoom: 15
          ),
          onMapCreated: (GoogleMapController googleMapController){
         //   googleMapController.showMarkerInfoWindow(MarkerId('1'));
            setState(() {
              myMarkers.add(Marker(markerId:MarkerId('1'),
            position: LatLng(31.2001, 29.9187),
            visible: true,
            infoWindow: InfoWindow(
              title: 'خواطر دمشقيه',
              snippet: 'خواطر دمشقيه',
              onTap: (){},
            ),
            
             ),
             );
            });

          },
          markers: myMarkers,

          ),
        ]),
>>>>>>> Stashed changes
      
    );
  }
}