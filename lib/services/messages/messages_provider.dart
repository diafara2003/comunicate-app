// To parse this JSON data, do
//
//     final messageProvider = messageProviderFromJson(jsonString);

import 'package:comunicate_colegios_app/models/enviar_mensaje_models.dart';
import 'package:comunicate_colegios_app/models/message_models.dart';
import 'package:comunicate_colegios_app/models/messages_details_model.dart';
import 'package:comunicate_colegios_app/models/new_messages.dart';
import 'package:comunicate_colegios_app/models/person_models.dart';
import 'package:comunicate_colegios_app/models/response_models.dart';
import 'package:comunicate_colegios_app/services/Auth/PreferenciasUsuario.dart';

import '../../providers/Providers.dart';

class MessageProvider {
  Future<List<MessageDTO>> getMessages(int tipo) async {
    Providers obj = new Providers();

    try {
      String json = await obj.getAPI('BandejaEntrada/mensajes?tipo=$tipo');

      return new MessageDTO().messageProviderFromJson(json);
    } catch (e) {
      print(e);

      return <MessageDTO>[];
    }
  }

  Future nuevoMensaje(NewMessage modelo) async {
    Providers obj = new Providers();
    PreferenciasUsuario _user = new PreferenciasUsuario();

    try {
      modelo.mensaje.menUsuario = Usuario.fromJson(_user.usuario).perId;

      await obj.postAPI('Mensajes', modelo.toJson(), 0);

      return "";
    } catch (e) {
      print(e);

      return null;
    }
  }

  Future<ResponseDto> enviarMensaje(EnviarMensajeDto modelo) async {
    Providers obj = new Providers();

    try {
      Map<String, dynamic> _result =
          await obj.postAPI('Mensajes', modelo.toMap(), 0);

      ResponseDto _response = ResponseDto.fromMap(_result);

      return _response;
    } catch (e) {
      print(e);

      return null;
    }
  }

  Future<List<MessageDetatails>> getChat(int id) async {
    Providers obj = new Providers();

    try {
      String json = await obj.getAPI('Mensajes/chat?id=' + id.toString());
      List<MessageDetatails> _msn =
          new MessageDetatails().messageDetatailsFromMap(json);

      //   List<ChatDTO> map = ConvertMessageChat.map(_msn);
      return _msn;
    } catch (e) {
      print(e);

      return <MessageDetatails>[];
    }
  }
}
