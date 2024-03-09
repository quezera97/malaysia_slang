// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:translator_app/contsant/appBarTitle.dart';
import 'package:translator_app/ui/addWord.dart';
import 'package:translator_app/ui/slangExpansionTile.dart';

class SlangList extends StatefulWidget {
  final String selectedSlang;
  final List<String> selectedSlangList;

  SlangList({Key? key, required this.selectedSlang, required this.selectedSlangList}) : super(key: key);

  State<SlangList> createState() => _SlangListState();
}

class _SlangListState extends State<SlangList> {
  late SharedPreferences _prefs;

  String selectedAppBarHexCode = '#37306B';

  bool _searchByStateSlang = false;
  String searchedValue = '';

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

    return Scaffold(
      backgroundColor: HexColor('#EDE9D5'),
      appBar: AppBar(
        leading: _searchByStateSlang == false
            ? BackButton(
                color: Colors.white,
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.remove('prefsNegeri');
                  await prefs.remove('prefsListNegeri');
                  await prefs.remove('prefsSearchSlangByState');

                  Navigator.pop(context);
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () async {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SlangList(selectedSlang: widget.selectedSlang, selectedSlangList: widget.selectedSlangList)));
                },
              ),
        elevation: 0.0,
        backgroundColor: HexColor(selectedAppBarHexCode),
        centerTitle: false,
        title: AppBarTitle(),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddWord(slang: widget.selectedSlang)));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await _prefs.setBool('prefsSearchSlangByState', true);

                  setState(() {
                    _searchByStateSlang = true;
                  });
                },
              ),
            ],
          )
        ],
      ),
      body: _searchByStateSlang == false
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: widget.selectedSlangList.length,
              itemBuilder: (context, index) {
                var splittedList = widget.selectedSlangList[index].split("+");

                return SlangExpansionTileWidget(
                  slangTitle: splittedList[0],
                  malayTitle: splittedList[1],
                  englishTitle: splittedList[2],
                );
              })
          : Column(
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
                    itemCount: widget.selectedSlangList.length,
                    itemBuilder: (context, index) {
                      if (searchedValue.isNotEmpty && !widget.selectedSlangList[index].toLowerCase().contains(searchedValue.toLowerCase())) {
                        return Container();
                      }

                      var splittedList = widget.selectedSlangList[index].split("+");

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
