import 'package:flutter/material.dart';
import 'package:translator_app/enum/cardEnum.dart';
import 'package:translator_app/ui/choiceCard/restaurant.dart';

class Choice {
  const Choice({required this.title, required this.image});
  final String title;
  final String image;
}

const List<Choice> slangChoices = const <Choice>[
  const Choice(title: 'K. Lumpur', image: 'assets/img/jata/kl.png'),
  const Choice(title: 'Selangor', image: 'assets/img/jata/selangor.png'),
  const Choice(title: 'Johor', image: 'assets/img/jata/johor.png'),
  const Choice(title: 'N. Sembilan', image: 'assets/img/jata/nismilan.png'),
  const Choice(title: 'Melaka', image: 'assets/img/jata/melaka.png'),
  const Choice(title: 'Kelantan', image: 'assets/img/jata/kelantan.png'),
  const Choice(title: 'Kedah', image: 'assets/img/jata/kedah.png'),
  const Choice(title: 'Pahang', image: 'assets/img/jata/pahang.png'),
  const Choice(title: 'Perak', image: 'assets/img/jata/perak.png'),
  const Choice(title: 'Perlis', image: 'assets/img/bendera/perlis.png'),
  const Choice(title: 'P. Pinang', image: 'assets/img/jata/penang.png'),
  const Choice(title: 'Sabah', image: 'assets/img/jata/sabah.png'),
  const Choice(title: 'Sarawak', image: 'assets/img/jata/sarawak.png'),
  const Choice(title: 'Terengganu', image: 'assets/img/jata/terengganu.png'),
];

class SelectCardSlang extends StatelessWidget {
  const SelectCardSlang({Key? key, required this.choice}) : super(key: key);
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
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FittedBox(
                  child: Image.asset(choice.image),
                  fit: BoxFit.fill,
                  ),
                Text(choice.title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF121212),
                    fontFamily: 'PoppinsBold'
                  )
                ),
              ]
            ),
          ),
        )
      )
    );
  }
}
