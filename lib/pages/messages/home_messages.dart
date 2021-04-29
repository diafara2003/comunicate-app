import 'package:comunicate_colegios_app/pages/home/menu_widget.dart';
import 'package:flutter/material.dart';

import 'list_messages.dart';
import 'new_message.dart';

class HomeMessagesPages extends StatefulWidget {
  static final String routeName = "message";

  HomeMessagesPages({Key key}) : super(key: key);

  @override
  _HomeMessagesPagesState createState() => _HomeMessagesPagesState();
}

class _HomeMessagesPagesState extends State<HomeMessagesPages> {
  int _currentIndex = 0;
  final tabs = [ListMessagesPages(0), ListMessagesPages(1)];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buildEnviados() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kBottomNavigationBarHeight,
      child: Material(
        child: InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Stack(
                    children: [
                      Icon(Icons.mail_outline),
                      Positioned(
                          right: -15.0,
                          top: -15.0,
                          child: Container(
                            height: 24.0,
                            width: 24.0,
                            constraints: BoxConstraints(
                              maxHeight: 45.0,
                              maxWidth: 45.0,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: Center(
                              child: Text('10'),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar2 = BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.send_rounded), label: 'Recibidos'),
        BottomNavigationBarItem(
            icon: new Stack(children: <Widget>[
              new Icon(Icons.email_rounded),
              new Positioned(
                // draw a red marble
                top: 0.0,
                right: 0.0,
                child: new Icon(Icons.brightness_1,
                    size: 8.0, color: Colors.redAccent),
              )
            ]),
            label: "Enviados"),
      ],
    );
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Mensajes'),
              actions: [
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.outgoing_mail, size: 30.0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewMessagePages()));
                  },
                ),
              ],
            ),
            drawer: MenuWidget(),
            bottomNavigationBar: bottomNavigationBar2,
            body: tabs[_currentIndex]));
  }
}
