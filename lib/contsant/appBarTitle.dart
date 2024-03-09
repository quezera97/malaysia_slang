import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'Slang', style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'PoppinsBold')),
          TextSpan(text: ' - Malay - ', style: TextStyle(fontSize: 15, color: Colors.yellow, fontFamily: 'PoppinsBold')),
          TextSpan(text: 'English', style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'PoppinsBold')),
        ],
      ),
    );
  }
}
