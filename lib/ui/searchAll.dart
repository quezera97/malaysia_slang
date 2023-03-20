import 'package:flutter/material.dart';
import 'package:translator_app/ui/listStateSlang/johor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:translator_app/ui/listStateSlang/kedah.dart';
import 'package:translator_app/ui/listStateSlang/kelantan.dart';
import 'package:translator_app/ui/listStateSlang/klselangor.dart';
import 'package:translator_app/ui/listStateSlang/melaka.dart';
import 'package:translator_app/ui/listStateSlang/nismilan.dart';
import 'package:translator_app/ui/listStateSlang/pahang.dart';
import 'package:translator_app/ui/listStateSlang/perak.dart';
import 'package:translator_app/ui/listStateSlang/perlis.dart';
import 'package:translator_app/ui/listStateSlang/pinang.dart';
import 'package:translator_app/ui/listStateSlang/sabah.dart';
import 'package:translator_app/ui/listStateSlang/sarawak.dart';
import 'package:translator_app/ui/listStateSlang/terengganu.dart';
import 'package:translator_app/ui/slangExpansionTile.dart';

class SearchAll extends StatefulWidget {
  State<SearchAll> createState() => _SearchAllState();
}

class _SearchAllState extends State<SearchAll> {
  String searchedValue = '';

  var items = [
    ...JohorList.johor,
    ...KedahList.kedah,
    ...KelantanList.kelantan,
    ...KlSelangorList.klselangor,
    ...MelakaList.melaka,
    ...NismilanList.nismilan,
    ...PahangList.pahang,
    ...PerakList.perak,
    ...PerlisList.perlis,
    ...PinangList.pinang,
    ...SabahList.sabah,
    ...SarawakList.sarawak,
    ...TerengganuList.terengganu
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EDE9D5'),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: HexColor('#37306B'),
        centerTitle: true,
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
                if (searchedValue.isNotEmpty &&
                    !items[index]
                        .toLowerCase()
                        .contains(searchedValue.toLowerCase())) {
                  return Container();
                }

                var splittedList = items[index].split("+");

                if (searchedValue.isNotEmpty) {
                  return SlangExpansionTileWidget(
                    slangTitle: splittedList[0],
                    malayTitle: splittedList[1],
                    englishTitle: splittedList[2],
                  );
                }

                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
