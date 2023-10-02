import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:malaysia_slang/ui/widget/emailTemplate.dart';
import 'package:malaysia_slang/ui/widget/snackBar.dart';

class Report extends StatefulWidget {
  final String word;

  const Report({super.key, required this.word});

  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late SharedPreferences _prefs;

  final reportDetailsController = TextEditingController();
  final reportWordController = TextEditingController();

  String selectedAppBarHexCode = '#37306B';

  void initState() {
    super.initState();
    reportWordController.text = widget.word;
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: HexColor(selectedAppBarHexCode),
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
      body: Form(
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
                              TextSpan(
                                  text: 'Word',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF121212),
                                      fontFamily: 'PoppinsBold')),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      maxLines: 2,
                      controller: reportWordController,
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
                              TextSpan(
                                  text: 'Report Details',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF121212),
                                      fontFamily: 'PoppinsBold')),
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
                      controller: reportDetailsController,
                      maxLines: 15,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Type here',
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
                            if (reportDetailsController.text.isNotEmpty) {
                              var emailresponse = await send(
                                reportSubject: reportWordController.text,
                                reportBody: reportDetailsController.text,
                              );

                              if (emailresponse != 'success') {
                                SnackBarWidget.succesSnackbar(context,
                                    snackBarContent: emailresponse,
                                    labelContent: 'Close');
                              }

                              Navigator.pop(context);
                            } else {
                              SnackBarWidget.warningSnackBar(context,
                                  snackBarContent:
                                      'Please type in the report text field!',
                                  labelContent: 'Close');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                            // minimumSize: MaterialStateProperty.all(
                            //     const Size(332, 50)),
                          ),
                          child: const Text('Report',
                              style: TextStyle(fontSize: 15)),
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
