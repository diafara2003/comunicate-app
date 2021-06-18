import 'package:comunicate_colegios_app/helper/utilities.dart';
import 'package:comunicate_colegios_app/models/message_models.dart';
import 'package:comunicate_colegios_app/services/messages/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'chat.dart';

class ListMessagesPages extends StatefulWidget {
  final int tipo;
  ListMessagesPages(this.tipo);

  @override
  _ListMessagesPagesState createState() => _ListMessagesPagesState();
}

class _ListMessagesPagesState extends State<ListMessagesPages> {
  Future<List<MessageDTO>> getMessages() async {
    MessageProvider _messagesProvider = new MessageProvider();
    return await _messagesProvider.getMessages(this.widget.tipo);
  }

  Widget renderMessage(MessageDTO modelo) {
    String nombre = modelo.perNombres;
    String apellido = modelo.perApellidos;
    String fecha = modelo.menFecha;

    DateTime tempDate = DateFormat('d/M/yyyy hh:mm').parse(fecha);

    return Container(
      padding: EdgeInsets.only(left: 2.0, top: 8.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                // border: Border.all(
                //     width: 2, color: Theme.of(context).secondaryHeaderColor),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2)
                ]),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 25.0,
              child: Text(
                Utilities.inicialesUsuario(nombre, apellido),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$nombre $apellido',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: modelo.banHoraLeido == null
                              ? FontWeight.w600
                              : FontWeight.w300),
                    ),
                    Text(
                      timeago.format(tempDate, locale: 'es'),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: modelo.banHoraLeido == null
                            ? FontWeight.w600
                            : FontWeight.w300,
                        // color: Colors.black54
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    modelo.menAsunto,
                    style: TextStyle(
                        fontWeight: modelo.banHoraLeido == null
                            ? FontWeight.w600
                            : FontWeight.w300),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: FutureBuilder(
          future: getMessages(),
          builder:
              (BuildContext contex, AsyncSnapshot<List<MessageDTO>> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            else {
              if (snapshot.data.length == 0) {
                return Card(
                    elevation: 1.0,
                    child: Container(
                      color: Theme.of(context).colorScheme.primaryVariant,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                          child: Text(
                        'No hay mensajes',
                        style: TextStyle(color: Colors.black87, fontSize: 15.0),
                      )),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                    ));
              } else
                return RefreshIndicator(
                  onRefresh: getMessages,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return (GestureDetector(
                        onTap: () {
                          MessageDTO modelo = snapshot.data[index];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPages(modelo.menId,
                                      modelo.perNombres, modelo.perApellidos)));
                        },
                        child: Column(
                          children: [
                            renderMessage(snapshot.data[index]),
                            Divider(
                              color: Colors.grey.shade400,
                            )
                          ],
                        ),
                      ));
                    },
                    itemCount: snapshot.data.length,
                  ),
                );
            }
          },
        ));
  }
}
