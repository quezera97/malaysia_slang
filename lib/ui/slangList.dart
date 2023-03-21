// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:translator_app/ui/addWord.dart';
import 'package:translator_app/ui/slangExpansionTile.dart';

class SlangList extends StatefulWidget {
  final String selectedSlang;
  final List<String> selectedSlangList;

  SlangList(
      {Key? key, required this.selectedSlang, required this.selectedSlangList})
      : super(key: key);

  State<SlangList> createState() => _SlangListState();
}

class _SlangListState extends State<SlangList> {
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

    return Scaffold(
      backgroundColor: HexColor('#EDE9D5'),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('prefsNegeri');
            await prefs.remove('prefsListNegeri');

            Navigator.pop(context);
          },
        ),
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
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddWord(slang: widget.selectedSlang)));
                },
              ),
            ],
          )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.selectedSlangList.length,
          itemBuilder: (context, index) {
            var splittedList = widget.selectedSlangList[index].split("+");

            return SlangExpansionTileWidget(
              slangTitle: splittedList[0],
              malayTitle: splittedList[1],
              englishTitle: splittedList[2],
            );
          }),
    );
  }
}
