import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:translator_app/ui/widget/emailTemplate.dart';
import 'package:translator_app/ui/widget/snackBar.dart';

class AddWord extends StatefulWidget {
  final String slang;

  const AddWord({super.key, required this.slang});

  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  Widget build(BuildContext context) {
    final stateController = TextEditingController(text: widget.slang);
    final addSlangController = TextEditingController();
    final addMalayController = TextEditingController();
    final addEnglishController = TextEditingController();

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
                                  text: 'State',
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
                              TextSpan(
                                  text: 'Slang',
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
                              TextSpan(
                                  text: 'Malay',
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
                              TextSpan(
                                  text: 'English',
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

                            if (addSlangController.text.isNotEmpty && 
                                addMalayController.text.isNotEmpty && 
                                addEnglishController.text.isNotEmpty) {

                              var emailresponse = await send(
                                reportSubject: stateController.text,
                                reportBody: textEmailBody,
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
                                      'Please type in the text field provided!',
                                  labelContent: 'Close');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                            // minimumSize: MaterialStateProperty.all(
                            //     const Size(332, 50)),
                          ),
                          child: const Text('Add',
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
