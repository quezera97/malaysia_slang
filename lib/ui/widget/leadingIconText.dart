import 'package:flutter/material.dart';

class LeadIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  LeadIconText({
    required this.icon,
    required this.text,
  });

  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            child: Icon(
              icon,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
