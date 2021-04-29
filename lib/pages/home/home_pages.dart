import 'package:flutter/material.dart';

import 'menu_widget.dart';

class HomePages extends StatefulWidget {
  static final String routeName = "home";
  HomePages({Key key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comunicate app'),
      ),
      drawer: MenuWidget(),
    );
  }
}
