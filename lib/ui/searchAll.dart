import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:malaysia_slang/ui/listStateSlang/johor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:malaysia_slang/ui/listStateSlang/kedah.dart';
import 'package:malaysia_slang/ui/listStateSlang/kelantan.dart';
import 'package:malaysia_slang/ui/listStateSlang/klselangor.dart';
import 'package:malaysia_slang/ui/listStateSlang/melaka.dart';
import 'package:malaysia_slang/ui/listStateSlang/nismilan.dart';
import 'package:malaysia_slang/ui/listStateSlang/pahang.dart';
import 'package:malaysia_slang/ui/listStateSlang/perak.dart';
import 'package:malaysia_slang/ui/listStateSlang/perlis.dart';
import 'package:malaysia_slang/ui/listStateSlang/pinang.dart';
import 'package:malaysia_slang/ui/listStateSlang/sabah.dart';
import 'package:malaysia_slang/ui/listStateSlang/sarawak.dart';
import 'package:malaysia_slang/ui/listStateSlang/terengganu.dart';
import 'package:malaysia_slang/ui/slangExpansionTile.dart';

import '../contsant/appBarTitle.dart';

class SearchAll extends StatefulWidget {
  State<SearchAll> createState() => _SearchAllState();
}

class _SearchAllState extends State<SearchAll> {
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

  String searchedValue = '';

  var items = [...JohorList.johor, ...KedahList.kedah, ...KelantanList.kelantan, ...KlSelangorList.klselangor, ...MelakaList.melaka, ...NismilanList.nismilan, ...PahangList.pahang, ...PerakList.perak, ...PerlisList.perlis, ...PinangList.pinang, ...SabahList.sabah, ...SarawakList.sarawak, ...TerengganuList.terengganu];

  Widget build(BuildContext context) {
    _loadSelectedTheme();

    return Scaffold(
      backgroundColor: HexColor('#EDE9D5'),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: HexColor(selectedAppBarHexCode),
        centerTitle: true,
        title: AppBarTitle(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
              ),
              onChanged: (value) {
                setState(() {
                  searchedValue = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (searchedValue.isNotEmpty && !items[index].toLowerCase().contains(searchedValue.toLowerCase())) {
                  return Container();
                }

                var splittedList = items[index].split("+");

                return SlangExpansionTileWidget(
                  slangTitle: splittedList[0],
                  malayTitle: splittedList[1],
                  englishTitle: splittedList[2],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
