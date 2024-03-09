import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:malaysia_slang/enum/stateEnum.dart';
import 'package:malaysia_slang/ui/settings/settings.dart';
import 'package:malaysia_slang/ui/slangList.dart';
import 'package:malaysia_slang/ui/listStateSlang/klselangor.dart';
import 'package:malaysia_slang/ui/listStateSlang/johor.dart';
import 'package:malaysia_slang/ui/listStateSlang/kedah.dart';
import 'package:malaysia_slang/ui/listStateSlang/kelantan.dart';
import 'package:malaysia_slang/ui/listStateSlang/melaka.dart';
import 'package:malaysia_slang/ui/listStateSlang/nismilan.dart';
import 'package:malaysia_slang/ui/listStateSlang/pahang.dart';
import 'package:malaysia_slang/ui/listStateSlang/perak.dart';
import 'package:malaysia_slang/ui/listStateSlang/perlis.dart';
import 'package:malaysia_slang/ui/listStateSlang/pinang.dart';
import 'package:malaysia_slang/ui/listStateSlang/sabah.dart';
import 'package:malaysia_slang/ui/listStateSlang/sarawak.dart';
import 'package:malaysia_slang/ui/listStateSlang/terengganu.dart';

class Choice {
  const Choice({required this.title, required this.image});
  final String title;
  final String image;
}

List<Choice> slangChoices = <Choice>[
  Choice(title: StateEnum.klselangor, image: 'assets/img/klselangor.png'),
  Choice(title: StateEnum.johor, image: 'assets/img/johor.png'),
  Choice(title: StateEnum.kedah, image: 'assets/img/kedah.png'),
  Choice(title: StateEnum.kelantan, image: 'assets/img/kelantan.png'),
  Choice(title: StateEnum.melaka, image: 'assets/img/melaka.png'),
  Choice(title: StateEnum.nismilan, image: 'assets/img/nismilan.png'),
  Choice(title: StateEnum.pahang, image: 'assets/img/pahang.png'),
  Choice(title: StateEnum.perak, image: 'assets/img/perak.png'),
  Choice(title: StateEnum.perlis, image: 'assets/img/perlis.png'),
  Choice(title: StateEnum.pinang, image: 'assets/img/penang.png'),
  Choice(title: StateEnum.sabah, image: 'assets/img/sabah.png'),
  Choice(title: StateEnum.sarawak, image: 'assets/img/sarawak.png'),
  Choice(title: StateEnum.terengganu, image: 'assets/img/terengganu.png'),
];

class SlangSelectCard extends StatelessWidget {
  const SlangSelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: HexColor('#EDE9D5'),
        shadowColor: Colors.grey,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              if (choice.title == StateEnum.klselangor) {
                await prefs.setString('prefsNegeri', StateEnum.klselangor);
                await prefs.setStringList(
                    'prefsListNegeri', KlSelangorList.klselangor);
              } else if (choice.title == StateEnum.johor) {
                await prefs.setString('prefsNegeri', StateEnum.johor);
                await prefs.setStringList('prefsListNegeri', JohorList.johor);
              } else if (choice.title == StateEnum.nismilan) {
                await prefs.setString('prefsNegeri', StateEnum.nismilan);
                await prefs.setStringList(
                    'prefsListNegeri', NismilanList.nismilan);
              } else if (choice.title == StateEnum.melaka) {
                await prefs.setString('prefsNegeri', StateEnum.melaka);
                await prefs.setStringList('prefsListNegeri', MelakaList.melaka);
              } else if (choice.title == StateEnum.kelantan) {
                await prefs.setString('prefsNegeri', StateEnum.kelantan);
                await prefs.setStringList(
                    'prefsListNegeri', KelantanList.kelantan);
              } else if (choice.title == StateEnum.kedah) {
                await prefs.setString('prefsNegeri', StateEnum.kedah);
                await prefs.setStringList('prefsListNegeri', KedahList.kedah);
              } else if (choice.title == StateEnum.pahang) {
                await prefs.setString('prefsNegeri', StateEnum.pahang);
                await prefs.setStringList('prefsListNegeri', PahangList.pahang);
              } else if (choice.title == StateEnum.perak) {
                await prefs.setString('prefsNegeri', StateEnum.perak);
                await prefs.setStringList('prefsListNegeri', PerakList.perak);
              } else if (choice.title == StateEnum.perlis) {
                await prefs.setString('prefsNegeri', StateEnum.perlis);
                await prefs.setStringList('prefsListNegeri', PerlisList.perlis);
              } else if (choice.title == StateEnum.pinang) {
                await prefs.setString('prefsNegeri', StateEnum.pinang);
                await prefs.setStringList('prefsListNegeri', PinangList.pinang);
              } else if (choice.title == StateEnum.sabah) {
                await prefs.setString('prefsNegeri', StateEnum.sabah);
                await prefs.setStringList('prefsListNegeri', SabahList.sabah);
              } else if (choice.title == StateEnum.sarawak) {
                await prefs.setString('prefsNegeri', StateEnum.sarawak);
                await prefs.setStringList(
                    'prefsListNegeri', SarawakList.sarawak);
              } else if (choice.title == StateEnum.terengganu) {
                await prefs.setString('prefsNegeri', StateEnum.terengganu);
                await prefs.setStringList(
                    'prefsListNegeri', TerengganuList.terengganu);
              }

              if (choice.title == StateEnum.settings) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              } else {
                slangListFunc(context, prefs);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Image.asset(choice.image),
                      ),
                      Text(choice.title,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF121212),
                              fontFamily: 'PoppinsBold')),
                    ]),
              ),
            )));
  }
}

void slangListFunc(context, prefs) {
  var slang = prefs.getString('prefsNegeri');
  var listSlang = prefs.getStringList('prefsListNegeri');

  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SlangList(selectedSlang: slang!, selectedSlangList: listSlang!)));
}
