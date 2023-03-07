import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatefulWidget {
  final String expansionTileTitle;
  final String listTileTitle;
  final String assetUrlRestaurant;

  ExpansionTileWidget({
    super.key,
    required this.expansionTileTitle,
    required this.listTileTitle,
    required this.assetUrlRestaurant,
  });

  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.expansionTileTitle),
      children: <Widget>[
        ListTile(
          title: Text(widget.listTileTitle),
          trailing: CircleAvatar(
            radius: 20,
            child: IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 20,
              onPressed: () async {
                await audioPlayer.play(AssetSource(widget.assetUrlRestaurant));
              },
            ),
          ),
        ),
      ]
    );
  }
}

