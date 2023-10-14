import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  late double lat;
  late double long;
  String locationMessage = 'Localisation actuelle';

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location désactivée');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Localisation refusée');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Localisation refusée pour toujours');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      return "${place.subLocality} ${place.street}, ${place.locality}, ${place.country}";
    } catch (e) {
      print("Erreur lors de la récupération de l'adresse: $e");
      return "Adresse introuvable";
    }
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

                  String address = await _getAddressFromCoordinates(lat, long);

                  setState(() {
                    locationMessage = 'Adresse: $address';
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
