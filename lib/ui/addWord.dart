import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:malaysia_slang/ui/widget/emailTemplate.dart';
import 'package:malaysia_slang/ui/widget/snackBar.dart';

import '../contsant/appBarTitle.dart';

class AddWord extends StatefulWidget {
  final String slang;

  const AddWord({super.key, required this.slang});

  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final _formKey = GlobalKey<FormState>();

  final stateController = TextEditingController();
  final addSlangController = TextEditingController();
  final addMalayController = TextEditingController();
  final addEnglishController = TextEditingController();

  late SharedPreferences _prefs;

  String selectedAppBarHexCode = '#37306B';

  void initState() {
    super.initState();
    stateController.text = widget.slang;
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'State', style: TextStyle(fontSize: 15, color: Color(0xFF121212), fontFamily: 'PoppinsBold')),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: stateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Slang', style: TextStyle(fontSize: 15, color: Color(0xFF121212), fontFamily: 'PoppinsBold')),
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: addSlangController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Malay', style: TextStyle(fontSize: 15, color: Color(0xFF121212), fontFamily: 'PoppinsBold')),
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: addMalayController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'English', style: TextStyle(fontSize: 15, color: Color(0xFF121212), fontFamily: 'PoppinsBold')),
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: addEnglishController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  children: <Widget>[
                    Align(
                        alignment: const Alignment(0, 0.80),
                        child: ElevatedButton(
                          onPressed: () async {
                            var word = 'Word to be added:';
                            var slang = addSlangController.text;
                            var malay = addMalayController.text;
                            var english = addEnglishController.text;

                            String textEmailBody = '$word \n Slang: $slang \n\n Malay: $malay \n\n English: $english';

                            if (addSlangController.text.isNotEmpty && addMalayController.text.isNotEmpty && addEnglishController.text.isNotEmpty) {
                              var emailresponse = await send(
                                reportSubject: stateController.text,
                                reportBody: textEmailBody,
                              );

                              if (emailresponse != 'success') {
                                SnackBarWidget.succesSnackbar(context, snackBarContent: emailresponse, labelContent: 'Close');
                              }

                              Navigator.pop(context);
                            } else {
                              SnackBarWidget.warningSnackBar(context, snackBarContent: 'Please type in the text field provided!', labelContent: 'Close');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                            // minimumSize: MaterialStateProperty.all(
                            //     const Size(332, 50)),
                          ),
                          child: const Text('Add', style: TextStyle(fontSize: 15)),
                        )),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
