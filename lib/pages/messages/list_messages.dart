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

  Container renderMessage(MessageDTO modelo) {
    String nombre = modelo.perNombres;
    String apellido = modelo.perApellidos;
    String fecha = modelo.menFecha;

    DateTime tempDate = DateFormat('d/M/yyyy hh:mm').parse(fecha);

    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 5.0, right: 20.0, left: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChatPages(modelo.menId, modelo.perNombres)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    radius: 25.0,
                    child: Text(Utilities.inicialesUsuario(nombre, apellido)),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$nombre $apellido',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        child: Text(
                          modelo.menAsunto,
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  // modelo.menFecha
                  timeago.format(tempDate, locale: 'es'),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: EdgeInsets.only(top: 15.0),
          child: FutureBuilder(
            future: getMessages(),
            builder: (BuildContext contex,
                AsyncSnapshot<List<MessageDTO>> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              else {
                if (snapshot.data.length == 0) {
                  return Card(
                      elevation: 2.0,
                      child: Container(
                        color: Colors.blue[200],
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                            child: Text(
                          'No hay mensajes',
                          style:
                              TextStyle(color: Colors.black87, fontSize: 15.0),
                        )),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                      ));
                } else
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return (Container(
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
                  );
              }
            },
          )),
    );
  }
}
