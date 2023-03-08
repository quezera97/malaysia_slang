import 'package:flutter/material.dart';
import 'package:translator_app/ui/widget/expansionTile.dart';
import '../class/accommodationList.dart';

class Accommodation extends StatefulWidget {
  const Accommodation({super.key});

  State<Accommodation> createState() => _AccommodationState();
}

class _AccommodationState extends State<Accommodation> {
  var accommodationList = AccommodationList.accommodation;
  var vocabList = AccommodationList.essentialVocab;

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
                  text: 'Accommodation',
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
                'Accommodation',
                style: TextStyle(color: Colors.white, letterSpacing: 2.0),
              ),
            ),
            ListView.builder(
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
                }),
            Container(
              padding: const EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Text(
                'Essential Vocabulary',
                style: TextStyle(color: Colors.white, letterSpacing: 2.0),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: vocabList.length,
                itemBuilder: (context, index) {
                  var splittedVocabList = vocabList[index].split("+");

                  return ExpansionTileWidget(
                    expansionTileTitle: splittedVocabList[0],
                    listTileTitle: splittedVocabList[1],
                    assetUrl: splittedVocabList[2],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
