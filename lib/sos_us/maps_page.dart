import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sos_us/sos_us/features_page.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);

  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;

        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );

        setState(() {});
      },
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          currentLocation == null
              ? const Center(child: Text("loading..."))
              : GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 13.5,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId("currentLocation"),
                      position: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                    ),
                  },
                  onMapCreated: (mapController) {
                    _controller.complete(mapController);
                  },
                ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 260,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const FeaturesPage(),
            ),
          ),
        ],
      ),
    );
    // floatingActionButton: FloatingActionButton.extended(
    //   onPressed: _goToTheLake,
    //   label: const Text('To the lake!'),
    //   icon: const Icon(Icons.directions_boat),
    // ),
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}



// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);

//   LocationData? currentLocation;

//   void getCurrentLocation() async {
//     Location location = Location();

//     location.getLocation().then(
//       (location) {
//         currentLocation = location;
//       },
//     );

//     GoogleMapController googleMapController = await _controller.future;

//     location.onLocationChanged.listen(
//       (newLoc) {
//         currentLocation = newLoc;

//         googleMapController.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               zoom: 13.5,
//               target: LatLng(
//                 newLoc.latitude!,
//                 newLoc.longitude!,
//               ),
//             ),
//           ),
//         );

//         setState(() {});
//       },
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: currentLocation == null
//           ? const Center(child: Text("loading..."))
//           : Stack(
//               children: [
//                 GoogleMap(
//                   mapType: MapType.normal,
//                   initialCameraPosition: CameraPosition(
//                     target: LatLng(currentLocation!.latitude!,
//                         currentLocation!.longitude!),
//                     zoom: 13.5,
//                   ),
//                   markers: {
//                     Marker(
//                       markerId: const MarkerId("currentLocation"),
//                       position: LatLng(currentLocation!.latitude!,
//                           currentLocation!.longitude!),
//                     ),
//                   },
//                   onMapCreated: (mapController) {
//                     _controller.complete(mapController);
//                   },
//                 ),
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   bottom: 0,
//                   child: Container(
//                     height: 260,
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(45),
//                         topRight: Radius.circular(45),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.3),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: const FeaturesPage(),
//                   ),
//                 ),
//               ],
//             ),
//     );
//     // floatingActionButton: FloatingActionButton.extended(
//     //   onPressed: _goToTheLake,
//     //   label: const Text('To the lake!'),
//     //   icon: const Icon(Icons.directions_boat),
//     // ),
//   }

//   // Future<void> _goToTheLake() async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   // }
// }