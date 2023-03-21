import 'package:flutter/material.dart';

class AlertPopUp extends StatelessWidget {
  final String titleAlert;
  final String contentAlert;

  const AlertPopUp(
      {super.key, required this.titleAlert, required this.contentAlert});

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleAlert),
      content: Text(contentAlert),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
