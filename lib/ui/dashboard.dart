import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_app/ui/widget/listTileDashboard.dart';
import 'package:hexcolor/hexcolor.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#EDE9D5'),
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('prefsNegeri');

              Navigator.pop(context);
            },
          ),
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
            childAspectRatio: 1.7,
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            children: List.generate(dashboardChoices.length, (index) {
              return Center(
                child: ListTileDashboard(choice: dashboardChoices[index]),
              );
            })));
  }
}
