import 'package:flutter/material.dart';

import 'pages/calendar/calendar_pages.dart';
import 'pages/home/home_pages.dart';
import 'pages/messages/home_messages.dart';
import 'pages/profile/profile_pages.dart';
import 'pages/signin.dart';
import 'services/Auth/PreferenciasUsuario.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  dynamic token = await prefs.initPrefs();
  runApp(MyApp(token));
}

class MyApp extends StatefulWidget {
  final String token = "";

  MyApp(token);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comunicate App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SignInPages.routeName,
      // widget.token != '' ? HomePages.routeName : SignInPages.routeName,
      routes: {
        HomePages.routeName: (BuildContext context) => HomePages(),
        ProfilePages.routeName: (BuildContext context) => ProfilePages(),
        SignInPages.routeName: (BuildContext context) => SignInPages(),
        HomeMessagesPages.routeName: (BuildContext context) =>
            HomeMessagesPages(),
        CalendarPages.routeName: (BuildContext context) => CalendarPages()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
