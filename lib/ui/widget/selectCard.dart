import 'package:flutter/material.dart';
import 'package:translator_app/enum/cardEnum.dart';
import 'package:translator_app/ui/choiceCard/hotel.dart';
import 'package:translator_app/ui/choiceCard/restaurant.dart';

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Restaurant', icon: Icons.restaurant),
  const Choice(title: 'Hotel', icon: Icons.hotel),
  const Choice(title: 'Emergency', icon: Icons.emergency),
  // const Choice(title: 'Greetings', icon: Icons.handshake),
  // const Choice(title: 'Direction', icon: Icons.directions),
  // const Choice(title: 'Sightseeing', icon: Icons.holiday_village),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall;
    return Card(
      elevation: 10,
      color: Colors.white,
      shadowColor: Colors.grey,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (choice.title == CardEnum.restaurant) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Restaurant()));
          } else if (choice.title == CardEnum.hotel) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Hotel()));
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Icon(choice.icon,
                  size: 50.0, color: textStyle?.color)
                ),
              Text(choice.title,
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF121212),
                  fontFamily: 'PoppinsBold'
                )
              ),
            ]
          ),
        )
      )
    );
  }
}
