import 'package:flutter/material.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '10 000 FCFA / an',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 500),

                // Premium Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0),
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(colors: [
                          Color(0xff9796F0),
                          Color(0xffFBC7D4),
                        ]),
                      ),
                      child: const Center(
                        child: Text(
                          'Passer Premium',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
