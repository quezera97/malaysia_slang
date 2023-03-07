import 'package:flutter/material.dart';
import 'package:translator_app/ui/widget/selectCard.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.green,
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
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          children: List.generate(choices.length, (index) {
            return Center(
              child: SelectCard(choice: choices[index]),
            );
          }
        )
      )
    );
  }
}
