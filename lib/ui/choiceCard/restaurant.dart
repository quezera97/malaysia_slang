import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:translator_app/ui/widget/expansionTile.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Restaurant',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF121212),
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionTileWidget(
              expansionTileTitle: 'Can you recommended a restaurant?',
              listTileTitle: 'Restoran apa yang sedap eh?',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Can I have the menu, please?',
              listTileTitle: 'Bang/ Kak, menu ada tak?',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
          ],
        ),
      ),
    );
  }
}
