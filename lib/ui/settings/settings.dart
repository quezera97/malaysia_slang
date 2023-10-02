import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:malaysia_slang/ui/settings/colorPicker.dart';
import 'package:malaysia_slang/ui/settings/joinTextAboutUs.dart';
import 'package:malaysia_slang/ui/settings/joinTextPolicy.dart';
import 'package:malaysia_slang/ui/widget/alertPopUp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class Settings extends StatefulWidget {
  const Settings({super.key});

  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SharedPreferences _prefs;
  double _fontSize = 16.0;
  final String packageName = 'com.malaysia_slang';

  void initState() {
    super.initState();
    _loadSelectedTheme();
    _loadSliderFontSize();
  }

  Future<void> _loadSliderFontSize() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = _prefs.getDouble('prefsResizeText') ?? 16.0;
    });
  }

  Future<void> _saveSliderFontSize(double value) async {
    await _prefs.setDouble('prefsResizeText', value);
    setState(() {
      _fontSize = value;
    });
  }

  Future<void> _feedbackApp() async {
    if (Platform.isAndroid) {
      final url = Uri.parse('market://details?id=$packageName');

      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        Uri webUrl = Uri.parse(
            'https://play.google.com/store/apps/details?id=$packageName&showAllReviews=true');

        if (await canLaunchUrl(webUrl)) {
          await launchUrl(webUrl);
        } else {
          throw 'Could not launch $url';
        }
      }
    }
  }

  Future<void> _shareApp() async {
    final url = 'market://details?id=$packageName';

    if (await canLaunchUrl(Uri.parse(url))) {
      await Share.share(url);
    } else {
      String url =
          'https://play.google.com/store/apps/details?id=$packageName&showAllReviews=true';
      if (await canLaunchUrl(Uri.parse(url))) {
        await Share.share(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  String selectedAppBarHexCode = '#37306B';

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
                    text: 'Settings',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'PoppinsBold')),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              child: ListView(
                children: [
                Column(
                    children: <Widget>[
                      //customize theme
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ListTile(
                          title: Text(
                            'Customize Theme',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute( builder: (context) => ColorPickerScreen()));
                          }
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 209, 209, 209),
                      ), 
                      //resize text
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            'Resize text',
                            style: TextStyle(fontSize: _fontSize),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Slider(
                            value: _fontSize,
                            min: 10.0,
                            max: 30.0,
                            onChanged: (double value) {
                              _saveSliderFontSize(value);
                            },
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 209, 209, 209),
                      ),
                      //reset settings
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ListTile(
                          title: Text(
                            'Reset Settings',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            _prefs.remove('prefsResizeText');
                            _prefs.remove('prefsAppBarColor');
                            _loadSelectedTheme();
                            _loadSliderFontSize();
                          },
                        ),
                      ),
                      Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 209, 209, 209),
                        ),
                      //send feedback
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ListTile(
                          title: Text(
                            'Send Feedback',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.left,
                          ),
                          onTap: _feedbackApp,
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 209, 209, 209),
                      ),
                      //share & recommend
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ListTile(
                          title: Text(
                            'Share & Recommend',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.left,
                          ),
                          onTap: _shareApp,
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 209, 209, 209),
                      ),
                      //about us
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ListTile(
                          title: Text(
                            'About Us',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertPopUp(
                                  titleAlert: 'QueZ Apps', 
                                  contentAlert: joinedTextAboutUs(),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 209, 209, 209),
                      ),
                      //privacy policy
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ListTile(
                          title: Text(
                            'Privacy Policy',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertPopUp(
                                  titleAlert: 'Privacy Policy', 
                                  contentAlert: joinedTextPrivacyPolicy(),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    'Build Version: 1.0.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 70, 70, 70),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
