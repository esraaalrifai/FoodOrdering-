// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class MapPage extends StatefulWidget {
//   final LocationData currentLocation;
//   const MapPage({super.key, required this.currentLocation});
//
//   @override
//   State<MapPage> createState() => MapPageState();
// }
//
// class MapPageState extends State<MapPage> {
//   late CameraPosition initalCameraPosition;
//
//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   final Completer<GoogleMapController> _controller =
//   Completer<GoogleMapController>();
//
//   @override
//   void initState() {
//     initalCameraPosition = CameraPosition(
//       target: LatLng(widget.currentLocation.latitude ?? 37.43296265331129,
//           widget.currentLocation.longitude ?? -122.08832357078792),
//       zoom: 14.4746,
//     );
//
//     selectedLocation = LatLng(
//         widget.currentLocation.latitude ?? 37.43296265331129,
//         widget.currentLocation.longitude ?? -122.08832357078792);
//     super.initState();
//   }
//
//   Set<Marker> markers = {};
//
//   late LatLng selectedLocation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: initalCameraPosition,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//
//           setState(() {
//             markers.add(Marker(
//                 markerId: MarkerId('Current'),
//                 position: LatLng(
//                     widget.currentLocation.latitude ?? 37.43296265331129,
//                     widget.currentLocation.longitude ?? -122.08832357078792)));
//           });
//         },
//         markers: markers,
//         onTap: (latlong) {
//           setState(() {
//             selectedLocation = latlong;
//             markers.add(Marker(
//                 markerId: MarkerId('Current'),
//                 position: LatLng(latlong.latitude, latlong.longitude)));
//           });
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: const Text('To the lake!'),
//         icon: const Icon(Icons.directions_boat),
//       ),
//     );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodorderproject/core/enums/request_status.dart';
import 'package:foodorderproject/ui/views/map_view/map_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  final LocationData currentLocation;
  const MapView({super.key, required this.currentLocation});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapController(widget.currentLocation),
        builder: (mapController) {
          return Scaffold(
            body: GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: mapController.currentPosition,
              onMapCreated: (GoogleMapController controller) async {
                mapController.controller.complete(controller);

                mapController.addMarker(
                    imageName: 'pin.png',
                    position: LatLng(
                        widget.currentLocation.latitude ?? 37.42796133580664,
                        widget.currentLocation.longitude ?? -122.085749655962),
                    id: 'current');
              },
              markers: mapController.markers,
              onTap: (latlong) {
                mapController.selecteLocation = latlong;

                mapController.addMarker(
                    imageUrl: 'https://www.fluttercampus.com/img/car.png',
                    position: LatLng(latlong.latitude, latlong.longitude),
                    id: 'current');
              },
            ),
            floatingActionButton:
            mapController.requestStatus == RequestStatus.LOADING
                ? CircularProgressIndicator()
                : FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: Text(mapController.streetName.value),
              icon: const Icon(Icons.directions_boat),
            ),
          );
        });
  }

  Future<void> _goToTheLake() async {
    // final GoogleMapController controller = await _controller.future;
    // await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}