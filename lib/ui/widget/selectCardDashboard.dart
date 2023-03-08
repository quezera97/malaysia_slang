import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_app/enum/cardEnum.dart';
import 'package:translator_app/enum/stateEnum.dart';
import 'package:translator_app/ui/choiceCard/accommodation.dart';
import 'package:translator_app/ui/choiceCard/restaurant.dart';

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> dashboardChoices = const <Choice>[
  const Choice(title: 'Restaurant', icon: Icons.restaurant),
  const Choice(title: 'Accommodation', icon: Icons.hotel),
  const Choice(title: 'Emergency', icon: Icons.emergency),
  const Choice(title: 'Greetings', icon: Icons.handshake),
  const Choice(title: 'Direction', icon: Icons.directions),
  const Choice(title: 'Sightseeing', icon: Icons.holiday_village),
];

class SelectCardDashboard extends StatelessWidget {
  const SelectCardDashboard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall;
    return Card(
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.grey,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              final prefsNegeri =
                  prefs.getString('prefsNegeri') ?? StateEnum.kl;

              if (choice.title == CardEnum.restaurant) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Restaurant(prefsRestaurant: prefsNegeri)));
              } else if (choice.title == CardEnum.accommodation) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Accommodation()));
              } else if (choice.title == CardEnum.emergency) {
                print(CardEnum.emergency);
              } else if (choice.title == CardEnum.greetings) {
                print(CardEnum.greetings);
              } else if (choice.title == CardEnum.direction) {
                print(CardEnum.direction);
              } else if (choice.title == CardEnum.sightseeing) {
                print(CardEnum.sightseeing);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Icon(choice.icon,
                              size: 50.0, color: textStyle?.color)),
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
