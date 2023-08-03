import 'package:flutter/material.dart';
import 'package:sos_us/services/premium_page.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
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
            'Nos Offres',
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
                    text: 'Freemium',
                  ),
                  Tab(
                    text: 'Premium ',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Gratuit'),
            ),
            Center(
              child: PremiumPage(),
            ),
          ],
        ),
      ),
    );
  }
}
