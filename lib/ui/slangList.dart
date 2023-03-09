// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:translator_app/ui/widget/expansionTile.dart';

class SlangList extends StatefulWidget {
  final String selectedSlang;
  final List<String> selectedSlangList;

  SlangList(
      {Key? key, required this.selectedSlang, required this.selectedSlangList})
      : super(key: key);

  State<SlangList> createState() => _SlangListState();
}

class _SlangListState extends State<SlangList> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#EDE9D5'),
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('prefsNegeri');
              await prefs.remove('prefsListNegeri');

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
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.selectedSlangList.length,
            itemBuilder: (context, index) {
              var splittedAccommodationList =
                  widget.selectedSlangList[index].split("+");

              return ExpansionTileWidget(
                expansionTileTitle: splittedAccommodationList[0],
                listTileTitle: splittedAccommodationList[1],
                assetUrl: splittedAccommodationList[2],
              );
            }));
  }
}
