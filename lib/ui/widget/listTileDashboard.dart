// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:translator_app/ui/widget/expansionTile.dart';
import '../class/accommodationList.dart';

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

class ListTileDashboard extends StatelessWidget {
  ListTileDashboard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  var accommodationList = AccommodationList.accommodation;

  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: accommodationList.length,
      itemBuilder: (context, index) {
        var splittedAccommodationList =
            accommodationList[index].split("+");

        return ExpansionTileWidget(
          expansionTileTitle: splittedAccommodationList[0],
          listTileTitle: splittedAccommodationList[1],
          assetUrl: splittedAccommodationList[2],
        );
      }
    );
  }
}
