import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:malaysia_slang/ui/dashboard.dart';

class SplashScreen extends StatefulWidget {
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  ImageProvider preloadImage = AssetImage('assets/img/malaysia_flag_1.png');

  void initState() {
    super.initState();
    _startTime();
  }

  _startTime() async {
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

  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: HexColor('#37306B'),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: preloadImage,
                  // width: 100,
                  // height: 100,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
