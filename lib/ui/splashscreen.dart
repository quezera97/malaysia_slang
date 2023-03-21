import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_app/ui/dashboard.dart';

class SplashScreen extends StatefulWidget {
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  late SharedPreferences _prefs;

  String selectedAppBarHexCode = '#37306B';

  void initState() {
    super.initState();
    _loadSelectedTheme();
    startTime();
  }

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('prefsNegeri');
    await prefs.remove('prefsListNegeri');

    var duration = const Duration(seconds: 4);
    return Timer(duration, routeDashboardMain);
  }

  routeDashboardMain() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  
  Future<void> _loadSelectedTheme() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedAppBarHexCode = _prefs.getString('prefsAppBarColor') ?? '#37306B';
    });
  }

  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: HexColor(selectedAppBarHexCode),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/img/malaysia_flag_1.png'),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Slang',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: 'PoppinsBold')),
                      TextSpan(
                          text: ' - Malay - ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.yellow,
                              fontFamily: 'PoppinsBold')),
                      TextSpan(
                          text: 'English',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: 'PoppinsBold')),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
