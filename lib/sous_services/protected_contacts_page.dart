import 'package:flutter/material.dart';

class ProtectedContactsPage extends StatelessWidget {
  const ProtectedContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Expanded(
                      child: Icon(Icons.person),
                    ),
                  ),
                  Text('poulet'),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(Icons.delete),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
