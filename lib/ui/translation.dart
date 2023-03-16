import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:translator_app/ui/widget/snackBar.dart';

class TranslationPage extends StatefulWidget {
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  GoogleTranslator translator = GoogleTranslator();

  String malayLanguage = '';
  var englishLanguage = TextEditingController();
  String selectedLanguage = 'English';

  void trans() {
    if (englishLanguage.text.isNotEmpty) {
      translator.translate(englishLanguage.text, to: "ms").then((value) {
        setState(() {
          malayLanguage = value.toString();
        });
      });
    } else {
      SnackBarWidget.warningSnackBar(context,
          snackBarContent: 'Please enter a word!', labelContent: 'Close');
    }
  }

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (error) {
      SnackBarWidget.warningSnackBar(context,
          snackBarContent: error.toString(), labelContent: 'Close');
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Widget build(BuildContext context) {
    var connResult = _connectionStatus.toString().split(".");

    return Scaffold(
      backgroundColor: HexColor('#EDE9D5'),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: HexColor('#FFACAC'),
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'English - ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF121212),
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'Malay',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextField(
                  controller: englishLanguage,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        connResult[1] == 'none'
                            ? Icons.search_off
                            : Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        if (connResult[1] == 'none') {
                          SnackBarWidget.warningSnackBar(context,
                              snackBarContent: 'No Internet connection!',
                              labelContent: 'Close');
                        } else {
                          trans();
                        }
                      },
                    ),
                    hintText: 'Search',
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      malayLanguage = '';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 10.0, right: 10.0),
                      child: SelectableText(
                        malayLanguage,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PoppinsReg',
                        ),
                        showCursor: true,
                        cursorColor: Colors.white,
                        minLines: 5,
                        maxLines: 999,
                        scrollPhysics: ClampingScrollPhysics(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
