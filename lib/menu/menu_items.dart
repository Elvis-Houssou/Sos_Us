import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.icon, required this.title});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 34,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
