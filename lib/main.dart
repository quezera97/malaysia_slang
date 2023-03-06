import 'package:flutter/material.dart';
import 'package:translator_app/ui/dashboard.dart';
import 'package:translator_app/ui/splashscreen.dart';
import 'package:translator_app/ui/translation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iGuaman Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: HomePage(),
      routes: {
        '/': (context) => SplashScreen(),
        '/dashboard': (context) => MainDashboard(),
        '/translation': (context) => TranslationPage(),
      },
    );
  }
}
