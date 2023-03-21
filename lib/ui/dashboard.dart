import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_app/ui/searchAll.dart';
import 'package:translator_app/ui/settings.dart';
import 'package:translator_app/ui/translation.dart';
import 'package:translator_app/ui/slangSelectCard.dart';
import 'package:hexcolor/hexcolor.dart';

import 'aboutMalaysia/about.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late SharedPreferences _prefs;

  String selectedAppBarHexCode = '#37306B';

  @override
  void initState() {
    super.initState();
    _loadSelectedTheme();
  }

  Future<void> _loadSelectedTheme() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedAppBarHexCode = _prefs.getString('prefsAppBarColor') ?? '#37306B';
    });
  }

  Widget build(BuildContext context) {
    _loadSelectedTheme();
    
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: HexColor('#66347F'),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: HexColor(selectedAppBarHexCode),
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
          bottom: TabBar(
            tabs: [
              Tab(text: 'Slang'),
              Tab(text: 'About Malaysia'),
            ],
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
        body: TabBarView(
          children: [
            GridView.count(
                padding: EdgeInsets.all(10),
                childAspectRatio: 1.3,
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                children: List.generate(slangChoices.length, (index) {
                  return Center(
                    child: SlangSelectCard(choice: slangChoices[index]),
                  );
                })),

            //about malaysia
            AboutMalaysia(),
          ],
        ),
      ),
    );
  }
}
