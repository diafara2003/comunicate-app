import 'package:comunicate_colegios_app/pages/signin.dart';
import 'package:flutter/material.dart';

class AutenticatePages extends StatefulWidget {
  AutenticatePages({Key key}) : super(key: key);

  @override
  _AutenticatePagesState createState() => _AutenticatePagesState();
}

class _AutenticatePagesState extends State<AutenticatePages> {
  bool showSignIn = false;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SignInPages();
  }
}
