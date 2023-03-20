import 'package:flutter/material.dart';

class LongTextAboutMalaysia extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            '   Malaysia is a Southeast Asian country occupying parts of the Malay Peninsula and the island of Borneo. Malaysia consists of 13 states and 3 federal territories.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'PoppinsBold',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            'The 13 states of Malaysia are Perlis, Kedah, Penang, Perak, Selangor, Negeri Sembilan, Malacca, Johore, Kelantan, Terengganu, Pahang, Sabah and Sarawak.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'PoppinsBold',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            'The 3 federal territories are Kuala Lumpur, the capital of Malaysia, Putrajaya, the federal administrative capital and Labuan is the one and only federal territory in East Malaysia.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'PoppinsBold',
            ),
          ),
        ),
      ],
    );
  }
}
