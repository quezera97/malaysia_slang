// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator_app/ui/report.dart';
import 'package:translator_app/ui/widget/leadingIconText.dart';
import 'package:translator_app/ui/widget/snackBar.dart';
import 'package:share_plus/share_plus.dart';

class ExpansionTileWidget extends StatefulWidget {
  final String slangTitle;
  final String malayTitle;
  final String englishTitle;

  ExpansionTileWidget({
    super.key,
    required this.slangTitle,
    required this.malayTitle,
    required this.englishTitle,
  });

  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  final audioPlayer = AudioPlayer();

  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(widget.slangTitle),
        subtitle: Text(widget.malayTitle),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: LeadIconText(icon: Icons.copy, text: 'Copy'),
                    onTap: () async {
                      await Clipboard.setData(
                          ClipboardData(text: widget.slangTitle));
                      SnackBarWidget.succesSnackbar(context,
                          snackBarContent: 'Copied to clipboard!',
                          labelContent: 'Close');
                    },
                  ),
                  PopupMenuItem(
                    child: LeadIconText(icon: Icons.share, text: 'Share'),
                    onTap: () async {
                      Share.share(widget.slangTitle);
                    },
                  ),
                  PopupMenuItem(
                    child: LeadIconText(icon: Icons.report, text: 'Report'),
                    onTap: () => Future(
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => Report(word: widget.slangTitle)),
                      ),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        children: <Widget>[
          ListTile(
            title: Align(
              alignment: Alignment.centerRight,
              child: Text(widget.englishTitle),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: LeadIconText(icon: Icons.copy, text: 'Copy'),
                        onTap: () async {
                          await Clipboard.setData(
                              ClipboardData(text: widget.englishTitle));
                          SnackBarWidget.succesSnackbar(context,
                              snackBarContent: 'Copied to clipboard!',
                              labelContent: 'Close');
                        },
                      ),
                      PopupMenuItem(
                        child: LeadIconText(icon: Icons.share, text: 'Share'),
                        onTap: () async {
                          Share.share(widget.englishTitle);
                        },
                      ),
                      PopupMenuItem(
                        child: LeadIconText(icon: Icons.report, text: 'Report'),
                        onTap: () => Future(
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) =>
                                    Report(word: widget.englishTitle)),
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ),
          )
        ]);
  }
}

// IconButton(
//   icon: Icon(Icons.play_arrow_sharp),
//   iconSize: 30,
//   onPressed: () async {
//     await audioPlayer.play(AssetSource(widget.assetUrl));
//   },
// ),
