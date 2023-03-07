import 'package:flutter/material.dart';

class SnackBarWidget {
  static void succesSnackbar(BuildContext context, { required String snackBarContent, required String labelContent }){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackBarContent),
      backgroundColor: Colors.green.shade300,
      action: SnackBarAction(
        label: labelContent,
        textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    ));
  }

  static void warningSnackBar(BuildContext context, { required String snackBarContent, required String labelContent }){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(snackBarContent),
      backgroundColor: Colors.red.shade300,
      action: SnackBarAction(
        label: labelContent,
        textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    ));
  }
}