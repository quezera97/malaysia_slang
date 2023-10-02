// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:malaysia_slang/ui/report.dart';
import 'package:malaysia_slang/ui/widget/leadingIconText.dart';
import 'package:malaysia_slang/ui/widget/snackBar.dart';
import 'package:share_plus/share_plus.dart';

class SlangExpansionTileWidget extends StatefulWidget {
  final String slangTitle;
  final String malayTitle;
  final String englishTitle;

  SlangExpansionTileWidget({
    super.key,
    required this.slangTitle,
    required this.malayTitle,
    required this.englishTitle,
  });

  _SlangExpansionTileWidgetState createState() =>
      _SlangExpansionTileWidgetState();
}

class _SlangExpansionTileWidgetState extends State<SlangExpansionTileWidget> {
  final audioPlayer = AudioPlayer();
  late SharedPreferences _prefs;
  double _resizedFontSize = 16.0;

  void initState() {
    super.initState();
    _loadSliderFontSize();
  }

  Future<void> _loadSliderFontSize() async {
    _prefs = await SharedPreferences.getInstance();
    // setState(() {
    _resizedFontSize = _prefs.getDouble('prefsResizeText') ?? 16.0;
    // });
  }

  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(widget.slangTitle,
            style: TextStyle(fontSize: _resizedFontSize)),
        subtitle: Text(widget.malayTitle,
            style: TextStyle(fontSize: _resizedFontSize)),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: LeadIconText(icon: Icons.copy, text: 'Salin'),
                    onTap: () async {
                      await Clipboard.setData(
                          ClipboardData(text: widget.slangTitle));
                      SnackBarWidget.succesSnackbar(context,
                          snackBarContent: 'Disalin ke papan klip!',
                          labelContent: 'Tutup');
                    },
                  ),
                  PopupMenuItem(
                    child: LeadIconText(icon: Icons.share, text: 'Kongsi'),
                    onTap: () async {
                      Share.share(widget.slangTitle);
                    },
                  ),
                  PopupMenuItem(
                    child: LeadIconText(icon: Icons.report, text: 'Lapor'),
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
              child: Text(widget.englishTitle,
                  style: TextStyle(fontSize: _resizedFontSize)),
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
