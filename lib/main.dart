import 'package:flutter/material.dart';
import 'package:translator_app/ui/dashboard.dart';
import 'package:translator_app/ui/slang.dart';
import 'package:translator_app/ui/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iGuaman Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: HomePage(),
      routes: {
        '/': (context) => SplashScreen(),
        '/dashboard': (context) => MainDashboard(),
        '/slang': (context) => SelectSlang(),
      },
    );
  }
}
