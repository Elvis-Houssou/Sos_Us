import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  String locationMessage = 'localisation actuelle';
  late double lat;
  late double long;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location desactivé');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('location refusé');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('location refuser pour tjrs');
    }
    return await Geolocator.getCurrentPosition();
  }

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton.icon(
              onPressed: () {
                _getCurrentLocation().then((value) async {
                  lat = value.latitude;
                  long = value.longitude;
                  await FirebaseFirestore.instance
                      .collection('location')
                      .add({'latitude': lat, 'longitude': long});
                  setState(() {
                    print(
                        locationMessage = 'Latitude: $lat , Longitude: $long');
                  });
                });
              },
              icon: const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              label: const Text("Localisation actuelle"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                elevation: 0,
                fixedSize: const Size(double.maxFinite, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          locationMessage,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
