import 'package:flutter/material.dart';
import 'package:sos_us/sous_services/protected_contacts_page.dart';
import 'package:sos_us/sous_services/trusted_contacts_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TabBar get _tabBar => const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.flight)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_car)),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.blueAccent),
          title: const Text(
            'Contacts & Protégés',
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          elevation: 2,
          shadowColor: Colors.blueAccent,
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: const Material(
              child: TabBar(
                labelColor: Colors.redAccent,
                indicatorColor: Colors.redAccent, //<-- selected text color
                unselectedLabelColor:
                    Colors.blueAccent, //<-- Unselected text color
                tabs: [
                  Tab(
                    text: 'Contacts de confiance',
                  ),
                  Tab(
                    text: 'Protégés ',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: TrustedContactsPage(),
            ),
            Center(
              child: ProtectedContactsPage(),
            ),
          ],
        ),
      ),
    );
  }
}
