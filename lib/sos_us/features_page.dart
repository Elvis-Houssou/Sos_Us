import 'package:flutter/material.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 0,
          left: 100,
          child: ElevatedButton(
            onPressed: () {
              // Action du deuxième bouton
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(40),
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              side: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            child: const Text(
              'SOS Danger',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 50,
          child: ElevatedButton(
            onPressed: () {
              // Action du deuxième bouton
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(40),
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              side: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            child: const Flexible(
              child: Text(
                'Zone à \n risque',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 50,
          child: ElevatedButton(
            onPressed: () {
              // Action du deuxième bouton
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(30),
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              side: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            child: const Center(
              child: Text(
                'Suivre \n mon \n itinéraire',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: ElevatedButton(
            onPressed: () {
              // Action du quatrième bouton
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(40),
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              side: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            child: const Text(
              'Malaise \n santé',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ElevatedButton(
            onPressed: () {
              // Action du troisième bouton
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(40),
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              side: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            child: const Text(
              'Femme \n Battue',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
