import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_app/ui/settings/colorPicker.dart';
import 'package:translator_app/ui/widget/alertPopUp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SharedPreferences _prefs;
  double _fontSize = 16.0;
  final String packageName = 'test';

  void initState() {
    super.initState();
    _loadSelectedTheme();
    _loadSliderValue();
  }

  Future<void> _loadSliderValue() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = _prefs.getDouble('prefsResizeText') ?? 16.0;
    });
  }

  Future<void> _saveSliderValue(double value) async {
    await _prefs.setDouble('prefsResizeText', value);
    setState(() {
      _fontSize = value;
    });
  }

  Future<void> _feedbackApp() async {
    Uri url = Uri.parse(
        'https://play.google.com/store/apps/details?id=$packageName&showAllReviews=true');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _shareApp() async {
    String url =
        'https://play.google.com/store/apps/details?id=$packageName&showAllReviews=true';

    if (await canLaunchUrl(Uri.parse(url))) {
      await Share.share(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String joinedTextAboutUs(){
    var lineOne = 'Our mission is to provide you with the best possible experience using our app.';
    var lineTwo = 'We are committed to constantly improving and updating our app to meet your needs.';
    var lineThree = 'If you have any questions or feedback, please don\'t hesitate to contact us at zaher@gmail.com.';
    var lineFour = 'Thank you for using our app!';

    var joinedText = lineOne + '\n\n' + lineTwo + '\n\n' + lineThree + '\n\n\n' + lineFour;

    return joinedText;
  }

  String joinedTextPrivacyPolicy(){
    var lineOne = 'We value your privacy and we have a simple policy:';
    var lineTwo = 'We do not collect any personal information from our users.';
    var lineThree = 'We do not require you to create an account, and we do not store any data on our servers.';
    var lineFour = 'By using our app, you agree to the terms of this privacy policy.';
    var lineFive = 'If you have any questions or concerns, please contact us at support@example.com';

    var joinedText = lineOne + '\n\n\n' + lineTwo + '\n\n' + lineThree + '\n\n\n' + lineFour + '\n\n' + lineFive;

    return joinedText;
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        'Resize text',
                        style: TextStyle(fontSize: _fontSize),
                        textAlign: TextAlign.left,
                      ),
                      subtitle: Slider(
                        value: _fontSize,
                        min: 10.0,
                        max: 30.0,
                        onChanged: (double value) {
                          _saveSliderValue(value);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Customize Theme',
                        style: TextStyle(fontSize: _fontSize),
                        textAlign: TextAlign.left,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute( builder: (context) => ColorPickerScreen()));
                      }
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Send Feedback',
                        style: TextStyle(fontSize: _fontSize),
                        textAlign: TextAlign.left,
                      ),
                      onTap: _feedbackApp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Share & Recommend',
                        style: TextStyle(fontSize: _fontSize),
                        textAlign: TextAlign.left,
                      ),
                      onTap: _shareApp,
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'About Us',
                        style: TextStyle(fontSize: _fontSize),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(fontSize: _fontSize),
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
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
