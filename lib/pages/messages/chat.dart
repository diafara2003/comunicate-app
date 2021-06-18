import 'package:comunicate_colegios_app/helper/utilities.dart';
import 'package:comunicate_colegios_app/models/Replica_message_models.dart';
import 'package:comunicate_colegios_app/models/enviar_mensaje_models.dart';
import 'package:comunicate_colegios_app/models/messages_details_model.dart';
import 'package:comunicate_colegios_app/models/person_models.dart';
import 'package:comunicate_colegios_app/pages/common/alert.dart';
import 'package:comunicate_colegios_app/services/Auth/PreferenciasUsuario.dart';
import 'package:comunicate_colegios_app/services/messages/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ChatPages extends StatefulWidget {
  final int id;
  final String nombre;
  final String apellido;

  ChatPages(this.id, this.nombre, this.apellido);

  @override
  _ChatPagesState createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {
  List<MessageDetatails> lstMessages = <MessageDetatails>[];
  MessageDetatails _msnCurrent = new MessageDetatails();
  PreferenciasUsuario _prefe = new PreferenciasUsuario();
  MessageProvider _messagesProvider = new MessageProvider();
  Usuario currentUser = new Usuario();

  TextEditingController msncontroller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> _user = _prefe.usuario;

    currentUser = Usuario.fromJson(_user);
  }

  void _enviarMensaje() async {
    EnviarMensajeDto _msn = new EnviarMensajeDto();

    _msn.destinatarios = [];
    _msn.destinatarios.add(DestinatariosDTO(
        id: _msnCurrent.menUsuario, tipo: _msnCurrent.menTipoMsn));
    _msn.adjuntos = [];
    _msn.mensaje = new ReplicaMsnDto(
        menId: 0,
        menUsuario: currentUser.perId,
        menClase: 1,
        menTipoMsn: 'E',
        menAsunto: '',
        menMensaje: msncontroller.text,
        menOkRecibido: 0,
        menSendTo: '',
        menCategoriaId: 0,
        menBloquearRespuesta: 0,
        menReplicaIdMsn: _msnCurrent.menId);

    msncontroller.text = "";

    showAlertDialog(context, "Enviando mensaje", "Por favor espere");
    await _messagesProvider.enviarMensaje(_msn);

    Navigator.of(context).pop(true);
    //back
    Navigator.of(context).pop(true);
  }

  Future<List<MessageDetatails>> getMessages() async {
    lstMessages = await _messagesProvider.getChat(this.widget.id);

    return lstMessages;
  }

  Widget _buildMessage(MessageDetatails mensaje, bool isMe) {
    var document = mensaje.menMensaje;

    if (!isMe) {
      _msnCurrent = mensaje;
    }

    String formattedDate = mensaje.menFecha.toString();

    //  if (mensaje.menFecha != null)
    //  DateFormat('dd/MM/yyyy').format(mensaje.menFecha);

    return Card(
      color: isMe ? Utilities.hexToColor('#99d8ff') : Colors.white,
      margin: EdgeInsets.all(5.0),
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 20.0,
                      child: Text(
                          Utilities.inicialesUsuario(mensaje.usuario.perNombres,
                              mensaje.usuario.perApellidos),
                          style: TextStyle(color: Colors.white))),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Text(
                          'De:',
                          textAlign: TextAlign.left,
                          style: TextStyle(),
                        ),
                        Text(
                            '${mensaje.usuario.perNombres} ${mensaje.usuario.perApellidos}')
                      ]),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Text(
                            formattedDate,
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Container(
                child: Html(
                  data: document,
                  defaultTextStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildessageComposer() {
    if (_msnCurrent.menBloquearRespuesta == 1)
      return Container();
    else
      return Row(
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0 * 0.74),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 20.0 / 4,
                    ),
                    Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: "Escribir mensaje",
                                border: InputBorder.none),
                            textCapitalization: TextCapitalization.sentences,
                            controller: msncontroller,
                            onChanged: (value) {
                              setState(() {});
                            })),
                    IconButton(
                        icon: Icon(Icons.send),
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.64),
                        onPressed: () {
                          _enviarMensaje();
                        }),
                  ])))
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                '${this.widget.nombre} ${this.widget.apellido}',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getMessages(),
                  builder: (BuildContext contex,
                      AsyncSnapshot<List<MessageDetatails>> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: CircularProgressIndicator());
                    else
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          final MessageDetatails message = snapshot.data[index];
                          final bool isMe =
                              message.menUsuario == currentUser.perId;
                          return _buildMessage(message, isMe);
                        },
                        itemCount: lstMessages.length,
                      );
                  }),
            ),
            Container(
              child: SafeArea(child: _buildessageComposer()),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 32,
                        color: Color(0xFF087949).withOpacity(0.08))
                  ]),
            )
          ],
        ));
  }
}
