import 'package:flutter/material.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Flutter',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF121212),
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'Translate',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const ExpansionTile(
              title: Text('ExpansionTile 1'),
              subtitle: Text('Trailing expansion arrow icon'),
              children: <Widget>[
                ListTile(title: Text('This is tile number 1')),
              ],
            ),
            ExpansionTile(
              title: const Text('ExpansionTile 2'),
              subtitle: const Text('Custom expansion arrow icon'),
              trailing: Icon(
                _customTileExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
              ),
              children: const <Widget>[
                ListTile(title: Text('This is tile number 2')),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
            ),
            const ExpansionTile(
              title: Text('ExpansionTile 3'),
              subtitle: Text('Leading expansion arrow icon'),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                ListTile(title: Text('This is tile number 3')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
