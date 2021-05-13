import 'package:comunicate_colegios_app/models/person_models.dart';
import 'package:comunicate_colegios_app/pages/calendar/calendar_pages.dart';
import 'package:comunicate_colegios_app/pages/messages/home_messages.dart';
import 'package:comunicate_colegios_app/services/Auth/PreferenciasUsuario.dart';
import 'package:flutter/material.dart';

import '../signin.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  Usuario _session = Usuario.fromJson(new PreferenciasUsuario().usuario);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "${_session.perNombres} ${_session.perApellidos}",
              style: TextStyle(color: Colors.blue[300], fontSize: 18),
            ),
            accountEmail: Text(_session.perDocumento,
                style: TextStyle(color: Colors.blue[300], fontSize: 15)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/kidsAvatar.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/originals/26/49/d0/2649d00fb18378864e9b2479143c7466.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.mail_rounded),
            title: Text('Mensajes'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, HomeMessagesPages.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.today_outlined),
            title: Text('Calendario'),
            onTap: () {
              Navigator.pushReplacementNamed(context, CalendarPages.routeName);
            },
          ),
          Divider(),
          // ListTile(
          //   leading: Icon(Icons.account_circle_sharp),
          //   title: Text('Perfil'),
          //   onTap: () {
          //     Navigator.pushReplacementNamed(context, ProfilePages.routeName);
          //   },
          // ),
          // Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar sesion'),
            onTap: () {
              PreferenciasUsuario _prefe = new PreferenciasUsuario();

              _prefe.token = "";
              _prefe.usuario = "";

              Navigator.pushReplacementNamed(context, SignInPages.routeName);
            },
          )
        ],
      ),
    );
  }
}
