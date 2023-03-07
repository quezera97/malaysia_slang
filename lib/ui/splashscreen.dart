import 'dart:async';

import 'package:flutter/material.dart';
import 'package:translator_app/ui/dashboard.dart';
import 'package:translator_app/ui/translation.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, routeDashboardMain);
  }
  
  routeDashboardMain() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>  MainDashboard()));
  }


  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Center(
            child: Container(
              child: Image.asset('assets/img/malaysia_flag_1.png'),
            ),
          )
        ],
      ),
    );
  }
}
