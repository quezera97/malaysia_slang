import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Widget build(BuildContext context) {
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
                        textAlign: TextAlign.center,
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
                  )
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
