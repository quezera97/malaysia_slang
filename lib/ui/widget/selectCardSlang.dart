import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_app/enum/stateEnum.dart';
import 'package:translator_app/ui/slangList.dart';
import 'package:translator_app/ui/stateSlang/kl.dart';
import 'package:translator_app/ui/stateSlang/selangor.dart';
import 'package:translator_app/ui/stateSlang/johor.dart';
import 'package:translator_app/ui/stateSlang/kedah.dart';
import 'package:translator_app/ui/stateSlang/kelantan.dart';
import 'package:translator_app/ui/stateSlang/melaka.dart';
import 'package:translator_app/ui/stateSlang/nismilan.dart';
import 'package:translator_app/ui/stateSlang/pahang.dart';
import 'package:translator_app/ui/stateSlang/perak.dart';
import 'package:translator_app/ui/stateSlang/perlis.dart';
import 'package:translator_app/ui/stateSlang/pinang.dart';
import 'package:translator_app/ui/stateSlang/sabah.dart';
import 'package:translator_app/ui/stateSlang/sarawak.dart';
import 'package:translator_app/ui/stateSlang/terengganu.dart';

class Choice {
  const Choice({required this.title, required this.image});
  final String title;
  final String image;
}

List<Choice> slangChoices = <Choice>[
  Choice(title: StateEnum.kl, image: 'assets/img/kl.png'),
  Choice(title: StateEnum.selangor, image: 'assets/img/selangor.png'),
  Choice(title: StateEnum.johor, image: 'assets/img/johor.png'),
  Choice(title: StateEnum.nismilan, image: 'assets/img/nismilan.png'),
  Choice(title: StateEnum.melaka, image: 'assets/img/melaka.png'),
  Choice(title: StateEnum.kelantan, image: 'assets/img/kelantan.png'),
  Choice(title: StateEnum.kedah, image: 'assets/img/kedah.png'),
  Choice(title: StateEnum.pahang, image: 'assets/img/pahang.png'),
  Choice(title: StateEnum.perak, image: 'assets/img/perak.png'),
  Choice(title: StateEnum.perlis, image: 'assets/img/perlis.png'),
  Choice(title: StateEnum.pinang, image: 'assets/img/penang.png'),
  Choice(title: StateEnum.sabah, image: 'assets/img/sabah.png'),
  Choice(title: StateEnum.sarawak, image: 'assets/img/sarawak.png'),
  Choice(title: StateEnum.terengganu, image: 'assets/img/terengganu.png'),
];

class SelectCardSlang extends StatelessWidget {
  const SelectCardSlang({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.grey,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              if (choice.title == StateEnum.kl) {
                await prefs.setString('prefsNegeri', StateEnum.kl);
                await prefs.setStringList('prefsListNegeri', KlList.kl);
              } else if (choice.title == StateEnum.selangor) {
                await prefs.setString('prefsNegeri', StateEnum.selangor);
                await prefs.setStringList(
                    'prefsListNegeri', SelangorList.selangor);
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

              var slang = prefs.getString('prefsNegeri');
              var listSlang = prefs.getStringList('prefsListNegeri');

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SlangList(
                          selectedSlang: slang!,
                          selectedSlangList: listSlang!)));
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
