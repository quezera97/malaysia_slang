// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator_app/ui/widget/snackBar.dart';

class ExpansionTileWidget extends StatefulWidget {
  final String expansionTileTitle;
  final String listTileTitle;
  final String assetUrl;

  ExpansionTileWidget({
    super.key,
    required this.expansionTileTitle,
    required this.listTileTitle,
    required this.assetUrl,
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
          trailing: Row( 
            mainAxisSize: MainAxisSize.min,
            children: [              
              IconButton(
                icon: Icon(Icons.play_arrow_sharp),
                iconSize: 30,
                onPressed: () async {
                  await audioPlayer.play(AssetSource(widget.assetUrl));
                },
              ),
              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text('Copy'),
                      onTap: () async {
                        await Clipboard.setData(ClipboardData(text: widget.listTileTitle));
                        SnackBarWidget.succesSnackbar(context, snackBarContent: 'Copied to clipboard!', labelContent: 'Close');
                      },
                    ),
                  ];
                },
              ),
            ],
          )        
        ),
      ]
    );
  }
}
