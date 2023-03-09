import 'package:flutter/material.dart';
import 'package:translator_app/ui/widget/selectCardSlang.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectSlang extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#EDE9D5'),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: HexColor('#FFACAC'),
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
        body: GridView.count(
            padding: EdgeInsets.all(10),
            childAspectRatio: 1.3,
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            children: List.generate(slangChoices.length, (index) {
              return Center(
                child: SelectCardSlang(choice: slangChoices[index]),
              );
            })));
  }
}
