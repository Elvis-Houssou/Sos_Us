import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sos_us/services/alert_page.dart';
import 'package:sos_us/services/contact_page.dart';
import 'package:sos_us/services/help_page.dart';
import 'package:sos_us/services/object_page.dart';
import 'package:sos_us/services/offers_page.dart';
import 'package:sos_us/services/reset_password_page.dart';

// import 'package:menu/menu_items.dart';

import 'menu_items.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class SideMenu extends StatelessWidget {
  SideMenu({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 50,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Text(
                  ' Elvis \n ${user.email!}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OffersPage(),
                ),
              );
            },
            child: const MenuItem(
              title: 'Nos offres',
              icon: Icons.local_offer_outlined,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactPage(),
                ),
              );
            },
            child: const MenuItem(
              title: 'Contacts & Protégés',
              icon: Icons.contacts,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AlertPage(),
                ),
              );
            },
            child: const MenuItem(
              title: "Message d'Alerte",
              icon: Icons.chat_rounded,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ObjectPage(),
                ),
              );
            },
            child: const MenuItem(
              title: 'Objets connectés',
              icon: Icons.cell_tower_outlined,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpPage(),
                ),
              );
            },
            child: const MenuItem(
              title: 'Aide',
              icon: Icons.help,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasswordPage(),
                ),
              );
            },
            child: const MenuItem(
              title: 'Modifier mot de passe',
              icon: Icons.lock_outlined,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // const MenuItem(
          //   title: 'Deconnexion',
          //   icon: Icons.settings_power,
          // ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const MenuItem(
              title: 'Deconnexion',
              icon: Icons.settings_power,
            ),
          ),
        ],
      ),
    );
  }
}





// Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'Menu',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );