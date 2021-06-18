import 'package:comunicate_colegios_app/pages/calendar/calendar_to_do_pages.dart';
import 'package:comunicate_colegios_app/providers/Providers.dart';
import 'package:comunicate_colegios_app/providers/push_notificacion_provider.dart';
import 'package:comunicate_colegios_app/providers/theme_provider.dart';
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
  await prefs.initPrefs();

  String token = prefs.token;

  bool _sesion = await new Providers().verificarSession();

  if (!_sesion) token = token = null;

  runApp(MyApp(token));
}

class MyApp extends StatefulWidget {
  final String _token;

  MyApp(this._token);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    final provider = new PushNotificacionProvider();

    provider.initNotificacions();

    PushNotificacionProvider.messageString.listen((message) {
      print('My app: $message');
      navigatorKey.currentState
          ?.pushNamed(HomeMessagesPages.routeName, arguments: message);

      final snackBar = SnackBar(content: Text('Nuevo mensaje'));

      scaffoldKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comunicate App',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldKey,
      // theme: MyTheme.lighttheme,
      // themeMode: ThemeMode.system,
      // darkTheme: MyTheme.darktheme,
      initialRoute: widget._token != null
          ? HomeMessagesPages.routeName
          : SignInPages.routeName,
      // widget.token != '' ? HomePages.routeName : SignInPages.routeName,
      routes: {
        HomePages.routeName: (BuildContext context) => HomePages(),
        ProfilePages.routeName: (BuildContext context) => ProfilePages(),
        SignInPages.routeName: (BuildContext context) => SignInPages(),
        HomeMessagesPages.routeName: (BuildContext context) =>
            HomeMessagesPages(),
        CalendarPages.routeName: (BuildContext context) => CalendarPages(),
        CalendarToDoPages.routeName: (BuildContext context) =>
            CalendarToDoPages()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
