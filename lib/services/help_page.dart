import 'package:flutter/material.dart';

import 'package:sos_us/services/alert_page.dart';
import 'package:sos_us/services/contact_page.dart';
import 'package:sos_us/services/object_page.dart';
import 'package:sos_us/services/offers_page.dart';
import '../menu/help_items.dart';

// import 'package:menu/menu_items.dart';

// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            "Aide",
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
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 15,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OffersPage(),
                        ),
                      );
                    },
                    child: const HelpItem(
                      title: 'Questions Fréquentes',
                      icon: Icons.quiz_rounded,
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
                    child: const HelpItem(
                      title: 'Contactez-nous',
                      icon: Icons.sms_rounded,
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
                    child: const HelpItem(
                      title: "Conditions & Confidentialité",
                      icon: Icons.file_copy,
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
                    child: const HelpItem(
                      title: "Infos de l'application",
                      icon: Icons.info,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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