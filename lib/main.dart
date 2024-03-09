import 'package:flutter/material.dart';
import 'package:malaysia_slang/ui/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Malaysia Slang',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: HomePage(),
      routes: {
        '/': (context) => SplashScreen(),
      },
    );
  }
}
