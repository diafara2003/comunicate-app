import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String header, String msn) {
  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(header),
          content: Text(msn),
        ),
      );
    },
  );
}
