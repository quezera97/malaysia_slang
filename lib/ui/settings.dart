import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#EDE9D5'),
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () async {
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
                        fontSize: 18,
                        color: Color(0xFF121212),
                        fontFamily: 'PoppinsBold')),
                TextSpan(
                    text: 'Malay - ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontFamily: 'PoppinsBold')),
                TextSpan(
                    text: 'English',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF121212),
                        fontFamily: 'PoppinsBold')),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
    );
  }
}