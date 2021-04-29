import 'package:comunicate_colegios_app/models/new_messages.dart';
import 'package:comunicate_colegios_app/models/search_to_models.dart';
import 'package:comunicate_colegios_app/pages/common/alert.dart';
import 'package:comunicate_colegios_app/services/messages/messages_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter/material.dart';

import 'data_search.dart';

class NewMessagePages extends StatefulWidget {
  NewMessagePages({Key key}) : super(key: key);

  @override
  _NewMessagePagesState createState() => _NewMessagePagesState();
}

class _NewMessagePagesState extends State<NewMessagePages> {
  final GlobalKey<TagsState> _globalkey = GlobalKey<TagsState>();

  final formkey = GlobalKey<FormState>();
  TextEditingController _mensajeText = new TextEditingController();
  TextEditingController _asuntotext = new TextEditingController();
  List tags = [];
  List<DestinatariosModel> _destinatarios = [];

  void _enviarMensaje(BuildContext context) async {
    if (formkey.currentState.validate()) {
      MessageProvider _provider = new MessageProvider();
      NewMessage _mensaje = new NewMessage();
      NewMessajeDto _objMensaje = new NewMessajeDto();

      _objMensaje.menMensaje = _mensajeText.text;
      _objMensaje.menAsunto = _asuntotext.text;
      _objMensaje.menOkRecibido = 0;
      _objMensaje.menBloquearRespuesta = 0;
      _objMensaje.menId = 0;
      _objMensaje.menFechaMaxima = null;
      _objMensaje.menEstado = 0;
      _objMensaje.menTipoMsn = "E";
      _objMensaje.menCategoriaId = -1;
      _objMensaje.menSendTo = "";

      _mensaje.adjuntos = [];
      _mensaje.destinatarios = [];

      _destinatarios.forEach((element) {
        _mensaje.destinatarios
            .add(new Destinatario(id: element.perId, tipo: element.tipo));
      });

      _mensaje.mensaje = _objMensaje;
      showAlertDialog(context, "Enviando mensaje", "Por favor espere");
      await _provider.nuevoMensaje(_mensaje);

      //dimiss modal
      Navigator.of(context).pop(true);
      //back
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo mensaje'),
        actions: [
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _enviarMensaje(context);
              })
        ],
      ),
      body: Form(
        key: formkey,
        child: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      'Para:',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Tags(
                            alignment: WrapAlignment.start,
                            key: _globalkey,
                            itemCount: tags.length,
                            columns: 6,
                            itemBuilder: (index) {
                              final Item currentItem = tags[index];

                              return ItemTags(
                                  activeColor: Colors.lightBlue[400],
                                  textStyle: TextStyle(fontSize: 14.0),
                                  combine: ItemTagsCombine.withTextBefore,
                                  onPressed: (i) {
                                    print(i);
                                  },
                                  removeButton:
                                      ItemTagsRemoveButton(onRemoved: () {
                                    setState(() {
                                      tags.removeAt(index);
                                      _destinatarios.removeAt(index);
                                    });
                                    return true;
                                  }),
                                  customData: currentItem.customData,
                                  index: index,
                                  title: currentItem.title);
                            },
                          )),
                    ),
                    IconButton(
                        iconSize: 30.0,
                        icon: Icon(Icons.add_circle),
                        onPressed: () async {
                          final _destinatario = await showSearch(
                              context: context, delegate: DataSearchPages());

                          if (_destinatario != null)
                            setState(() {
                              _destinatarios.add(_destinatario);
                              tags.add(Item(
                                  title:
                                      '${_destinatario.nombre} ${_destinatario.apellido}'));
                            });
                        })
                  ],
                ),
              ),
              Divider(
                color: Colors.blue[300],
              ),
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Asunto:"),
                      controller: _asuntotext,
                      validator: (val) {
                        if (val.isEmpty) return "Ingrese un asunto";

                        return null;
                      },
                      // decoration: InputDecoration(
                      //   border: UnderlineInputBorder(),
                      // ),
                    ),
                  ],
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _mensajeText,
                  validator: (val) {
                    if (val.isEmpty) return "Ingrese un mensaje a enviar";

                    return null;
                  },
                  maxLines: 15,
                  decoration: InputDecoration(hintText: ""),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
