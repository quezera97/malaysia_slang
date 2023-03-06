import 'package:flutter/material.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Flutter',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF121212),
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'Translate',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            ]
          ),
        ),
      ),
    );
  }
}