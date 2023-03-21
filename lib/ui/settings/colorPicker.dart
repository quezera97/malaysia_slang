import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorPickerScreen extends StatefulWidget {

  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
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

  Future<void> _selectColor(Color color) async {
    _prefs.setString('prefsAppBarColor', color.value.toRadixString(16));

    _loadSelectedTheme();
  }

  List<String> appBarHexColorList = <String>[
    '#B3005E',
    '#E90064',
    '#FF5F9E',    

    '#40513B',
    '#609966',
    '#9DC08B',    

    '#3E54AC',
    '#655DBB',
    '#BFACE2',

    '#66347F',
    '#9E4784',
    '#D27685',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EDE9D5'),
      appBar: AppBar(
        title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Color Picker',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'PoppinsBold'
                  ),
                ),
              ],
            ),
          ),
        centerTitle: true,
        backgroundColor: HexColor(selectedAppBarHexCode),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: GridView.builder(
                itemCount: appBarHexColorList.length, // number of items in the list
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0, // space between each row
                  crossAxisSpacing: 5, // space between each column
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _selectColor(HexColor(appBarHexColorList[index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                      // child: Text(appBarHexColorList[index]),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: HexColor(appBarHexColorList[index]),
                          // border: Border.all(color: Colors.black, width: 0.4),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  _selectColor(HexColor('#37306B'));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      'Reset Default',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue[900],
                      fontFamily: 'PoppinsBold'
                    ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
