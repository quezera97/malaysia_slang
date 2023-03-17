import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EDE9D5'),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: HexColor('#FFACAC'),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Slang - ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF121212),
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'Malay - ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'English',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF121212),
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
        ),
      ),
    );
  }
}
