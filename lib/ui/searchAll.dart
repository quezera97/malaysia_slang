import 'package:flutter/material.dart';
import 'package:translator_app/ui/stateSlang/johor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:translator_app/ui/stateSlang/kedah.dart';
import 'package:translator_app/ui/stateSlang/kelantan.dart';
import 'package:translator_app/ui/stateSlang/klselangor.dart';
import 'package:translator_app/ui/stateSlang/melaka.dart';
import 'package:translator_app/ui/stateSlang/nismilan.dart';
import 'package:translator_app/ui/stateSlang/pahang.dart';
import 'package:translator_app/ui/stateSlang/perak.dart';
import 'package:translator_app/ui/stateSlang/perlis.dart';
import 'package:translator_app/ui/stateSlang/pinang.dart';
import 'package:translator_app/ui/stateSlang/sabah.dart';
import 'package:translator_app/ui/stateSlang/sarawak.dart';
import 'package:translator_app/ui/stateSlang/terengganu.dart';
import 'package:translator_app/ui/widget/expansionTile.dart';

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
                  return ExpansionTileWidget(
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
