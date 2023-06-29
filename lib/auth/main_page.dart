import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:sos_us/menu/side_menu.dart';
import 'package:sos_us/sos_us/layout_page.dart';
// import '../sos_us/maps_page.dart';
import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LayoutScreen();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
