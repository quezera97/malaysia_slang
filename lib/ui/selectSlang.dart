import 'package:flutter/material.dart';
import 'package:translator_app/ui/searchAll.dart';
import 'package:translator_app/ui/settings.dart';
import 'package:translator_app/ui/translation.dart';
import 'package:translator_app/ui/widget/selectCardSlang.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectSlang extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#66347F'),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: HexColor('#37306B'),
          centerTitle: false,
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Slang',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'PoppinsBold')),
                TextSpan(
                    text: ' - Malay - ',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.yellow,
                        fontFamily: 'PoppinsBold')),
                TextSpan(
                    text: 'English',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'PoppinsBold')),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.g_translate_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TranslationPage()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchAll()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
              ],
            )
          ],
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
