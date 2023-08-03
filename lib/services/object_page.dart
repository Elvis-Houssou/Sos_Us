import 'package:flutter/material.dart';

import '../menu/help_items.dart';

class ObjectPage extends StatelessWidget {
  const ObjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Objects Connectés",
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.blueAccent,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: HelpItem(
                title: 'Details',
                icon: Icons.quiz_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
