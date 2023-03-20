import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'longTextAboutMalaysia.dart';

class AboutMalaysia extends StatelessWidget {
  const AboutMalaysia({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#66347F'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                child: Image.asset('assets/img/malaysia_icon.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: LongTextAboutMalaysia(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
