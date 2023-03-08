import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_app/enum/stateEnum.dart';
import 'package:translator_app/ui/dashboard.dart';

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
              } else if (choice.title == StateEnum.selangor) {
                await prefs.setString('prefsNegeri', StateEnum.selangor);
              } else if (choice.title == StateEnum.johor) {
                await prefs.setString('prefsNegeri', StateEnum.johor);
              } else if (choice.title == StateEnum.nismilan) {
                await prefs.setString('prefsNegeri', StateEnum.nismilan);
              } else if (choice.title == StateEnum.melaka) {
                await prefs.setString('prefsNegeri', StateEnum.melaka);
              } else if (choice.title == StateEnum.kelantan) {
                await prefs.setString('prefsNegeri', StateEnum.kelantan);
              } else if (choice.title == StateEnum.kedah) {
                await prefs.setString('prefsNegeri', StateEnum.kedah);
              } else if (choice.title == StateEnum.pahang) {
                await prefs.setString('prefsNegeri', StateEnum.pahang);
              } else if (choice.title == StateEnum.perak) {
                await prefs.setString('prefsNegeri', StateEnum.perak);
              } else if (choice.title == StateEnum.perlis) {
                await prefs.setString('prefsNegeri', StateEnum.perlis);
              } else if (choice.title == StateEnum.pinang) {
                await prefs.setString('prefsNegeri', StateEnum.pinang);
              } else if (choice.title == StateEnum.sabah) {
                await prefs.setString('prefsNegeri', StateEnum.sabah);
              } else if (choice.title == StateEnum.sarawak) {
                await prefs.setString('prefsNegeri', StateEnum.sarawak);
              } else if (choice.title == StateEnum.terengganu) {
                await prefs.setString('prefsNegeri', StateEnum.terengganu);
              }

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainDashboard()));
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
