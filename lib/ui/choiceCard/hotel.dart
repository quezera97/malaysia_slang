import 'package:flutter/material.dart';
import 'package:translator_app/ui/widget/expansionTile.dart';
import '../class/hotelList.dart';

class Hotel extends StatefulWidget {
  const Hotel({super.key});

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {  

  var hotelList = HotelList.hotel;
  var vocabList = HotelList.essentialVocab;

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
                  text: 'Hotel',
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
              child: Text('Hotel', style: TextStyle(
                  color: Colors.white, 
                  letterSpacing: 2.0
                ),
              ),
            ),
          
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: hotelList.length,
              itemBuilder: (context, index){
                var splittedHotelList = hotelList[index].split("+");

                return ExpansionTileWidget(
                  expansionTileTitle: splittedHotelList[0],
                  listTileTitle: splittedHotelList[1],
                  assetUrl: splittedHotelList[2],
                );
              }
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

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: vocabList.length,
              itemBuilder: (context, index){
                var splittedVocabList = vocabList[index].split("+");

                return ExpansionTileWidget(
                  expansionTileTitle: splittedVocabList[0],
                  listTileTitle: splittedVocabList[1],
                  assetUrl: splittedVocabList[2],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
