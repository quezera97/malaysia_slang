import 'package:flutter/material.dart';
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
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Text('Eating', style: TextStyle(
                  color: Colors.white, 
                  letterSpacing: 2.0
                ),
              ),
            ),
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
            ExpansionTileWidget(
              expansionTileTitle: 'What\'s this?',
              listTileTitle: 'Bang/ Kak, ni apa eh?',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'May I have a glass of water?',
              listTileTitle: 'Bang/ Kak, air kosong satu?',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Bill please?',
              listTileTitle: 'Kira bang/ kak?',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),

            Container(
              padding: const EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Text('Essential Vocabulary', style: TextStyle(
                  color: Colors.white, 
                  letterSpacing: 2.0
                ),
              ),
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Spoon',
              listTileTitle: 'Sudu',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Fork',
              listTileTitle: 'Garfu/ Garpu',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Knife',
              listTileTitle: 'Pisau',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Water',
              listTileTitle: 'Air',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Food',
              listTileTitle: 'Makanan',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Table',
              listTileTitle: 'Meja',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
            ExpansionTileWidget(
              expansionTileTitle: 'Chair',
              listTileTitle: 'Kerusi',
              assetUrlRestaurant: 'sound/restaurant/test.mp3',
            ),
          ],
        ),
      ),
    );
  }
}
