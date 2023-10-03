import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sos_us/sos_us/features_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
              zoom: 15.6746,
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

  // final List<Circle> _circles = const <Circle>[
  //   Circle(
  //     circleId: CircleId('1'),
  //     center: LatLng(37.33500926, -122.03272188),
  //     radius: 430,
  //     strokeWidth: 1,
  //     fillColor: Color.fromARGB(255, 182, 209, 255),
  //   ),
  // ];

  // Map<String, Circle> _circles = {};
  Map<CircleId, Circle> circles = <CircleId, Circle>{};

  void initCircle(specify, specifyId) async {
    var circleIdVal = specifyId;
    final CircleId circleId = CircleId(circleIdVal);
    final Circle circle = Circle(
      circleId: circleId,
      center: LatLng(
        specify['latitude'],
        specify['longitude'],
      ),
      strokeWidth: 1,
      strokeColor: const Color.fromARGB(255, 255, 106, 106),
      radius: 200,
      fillColor: const Color.fromARGB(255, 255, 106, 106),
    );

    setState(() {
      circles[circleId] = circle;
    });
  }

  getCircleData() async {
    FirebaseFirestore.instance.collection('location').get().then((mydata) {
      if (mydata.docs.isNotEmpty) {
        for (var i = 0; i < mydata.docs.length; i++) {
          initCircle(mydata.docs[i].data(), mydata.docs[i].id);
        }
      }
    });
  }

  // Set<Circle> getCircle() {
  //   return <Circle>[
  //     Circle(
  //       circleId: CircleId('mon nom'),
  //       center: LatLng(37.33500926, -122.03272188),
  //       strokeWidth: 1,
  //       radius: 230,
  //       fillColor: const Color.fromARGB(255, 152, 190, 255),
  //     )
  //   ].toSet();
  // }

  @override
  void initState() {
    // getDocID();
    getCircleData();
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
                    zoom: 14.6746,
                  ),
                  // onTap: (LatLng latlng) {
                  //   Circle circle = Circle(
                  //     circleId: CircleId(latlng.toString()),
                  //     center: latlng,
                  //     strokeWidth: 1,
                  //     radius: 30,
                  //     fillColor: const Color.fromARGB(255, 152, 190, 255),
                  //   );

                  //   setState(() {
                  //     _circles[latlng.toString()] = circle;
                  //     print(_circles);
                  //   });
                  // },
                  markers: {
                    Marker(
                      markerId: const MarkerId("currentLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                    ),
                  },
                  onMapCreated: (mapController) {
                    _controller.complete(mapController);
                  },
                  circles: Set<Circle>.of(circles.values),
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
