import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:malaysia_slang/ui/searchAll.dart';
import 'package:malaysia_slang/ui/settings/settings.dart';
import 'package:malaysia_slang/ui/translation.dart';
import 'package:malaysia_slang/ui/slangSelectCard.dart';
import 'package:hexcolor/hexcolor.dart';

import '../contsant/appBarTitle.dart';
import 'aboutMalaysia/about.dart';

class Dashboard extends StatefulWidget {
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late SharedPreferences _prefs;

  String selectedAppBarHexCode = '#37306B';

  void initState() {
    super.initState();
    _loadSelectedTheme();
  }

  Future<void> _loadSelectedTheme() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedAppBarHexCode = _prefs.getString('prefsAppBarColor') ?? '#66347F';
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
          title: AppBarTitle(),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TranslationPage()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchAll()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
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
