import 'package:comunicate_colegios_app/pages/home/menu_widget.dart';
import 'package:flutter/material.dart';

class ProfilePages extends StatefulWidget {
  ProfilePages({Key key}) : super(key: key);

  static final String routeName = "profile";

  @override
  _ProfilePagesState createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Comunicate App'),
      ),
      drawer: MenuWidget(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 80,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: ClipOval(
                  child: Image.asset(
                    'images/kidsAvatar.png',
                  ),
                ),
              ),
            ),
            TextField(
              style: TextStyle(fontSize: 20.0),
              decoration:
                  InputDecoration(labelText: "Nombres", hintText: "Nombres"),
            ),
            TextField(
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                  labelText: "Apellidos", hintText: "Apellidos"),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xff007EF4),
                    const Color(0xff2A75BC)
                  ]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Guardar cambios',
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
