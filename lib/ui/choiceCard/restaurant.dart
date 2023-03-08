// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:translator_app/enum/stateEnum.dart';
import 'package:translator_app/ui/widget/expansionTile.dart';
import '../class/restaurantList.dart';

class Restaurant extends StatefulWidget {
  String prefsRestaurant;

  Restaurant({super.key, required this.prefsRestaurant});

  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
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
              child: Text(
                'Restaurant',
                style: TextStyle(color: Colors.white, letterSpacing: 2.0),
              ),
            ),

            // if (widget.prefsRestaurant == StateEnum.kl) ... [
            //  restaurantList = RestaurantList.restaurant;
            // var vocabList = RestaurantList.essentialVocab;
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: RestaurantList.default_resturant.length,
                itemBuilder: (context, index) {
                  if (widget.prefsRestaurant == StateEnum.kl) {
                    var splittedRestaurantList =
                        RestaurantList.kl_restaurant[index].split("+");

                    return ExpansionTileWidget(
                      expansionTileTitle: splittedRestaurantList[0],
                      listTileTitle: splittedRestaurantList[1],
                      assetUrl: splittedRestaurantList[2],
                    );
                  } else if (widget.prefsRestaurant == StateEnum.johor) {
                    var splittedRestaurantList =
                        RestaurantList.johor_restaurant[index].split("+");

                    return ExpansionTileWidget(
                      expansionTileTitle: splittedRestaurantList[0],
                      listTileTitle: splittedRestaurantList[1],
                      assetUrl: splittedRestaurantList[2],
                    );
                  } else {
                    var splittedRestaurantList =
                        RestaurantList.default_resturant[index].split("+");

                    return ExpansionTileWidget(
                      expansionTileTitle: splittedRestaurantList[0],
                      listTileTitle: splittedRestaurantList[1],
                      assetUrl: splittedRestaurantList[2],
                    );
                  }
                }),
            // ],

            Container(
              padding: const EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Text(
                'Essential Vocabulary',
                style: TextStyle(color: Colors.white, letterSpacing: 2.0),
              ),
            ),
            // ListView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: vocabList.length,
            //     itemBuilder: (context, index) {
            //       var splittedVocabList = vocabList[index].split("+");

            //       return ExpansionTileWidget(
            //         expansionTileTitle: splittedVocabList[0],
            //         listTileTitle: splittedVocabList[1],
            //         assetUrl: splittedVocabList[2],
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
