// To parse this JSON data, do
//
//     final newMessage = newMessageFromJson(jsonString);

import 'dart:convert';

NewMessage newMessageFromJson(String str) =>
    NewMessage.fromJson(json.decode(str));

String newMessageToJson(NewMessage data) => json.encode(data.toJson());

class NewMessajeDto {
  NewMessajeDto({
    this.menId,
    this.menEmpId,
    this.menUsuario,
    this.menClase,
    this.menTipoMsn,
    this.menAsunto,
    this.menMensaje,
    this.menReplicaIdMsn,
    this.menOkRecibido,
    this.menSendTo,
    this.menBloquearRespuesta,
    this.menCategoriaId,
    this.menEstado,
    this.menFechaMaxima,
  });

  int menId;
  int menEmpId;
  int menUsuario;
  int menClase;
  String menTipoMsn;
  String menAsunto;
  String menMensaje;
  int menReplicaIdMsn;
  int menOkRecibido;
  String menSendTo;
  int menBloquearRespuesta;
  int menCategoriaId;
  int menEstado;
  dynamic menFechaMaxima;

  factory NewMessajeDto.fromJson(Map<String, dynamic> json) => NewMessajeDto(
        menId: json["MenId"],
        menEmpId: json["MenEmpId"],
        menUsuario: json["MenUsuario"],
        menClase: json["MenClase"],
        menTipoMsn: json["MenTipoMsn"],
        menAsunto: json["MenAsunto"],
        menMensaje: json["MenMensaje"],
        menReplicaIdMsn: json["MenReplicaIdMsn"],
        menOkRecibido: json["MenOkRecibido"],
        menSendTo: json["MenSendTo"],
        menBloquearRespuesta: json["MenBloquearRespuesta"],
        menCategoriaId: json["MenCategoriaId"],
        menEstado: json["MenEstado"],
        menFechaMaxima: json["MenFechaMaxima"],
      );

  Map<String, dynamic> toJson() => {
        "MenId": menId,
        "MenEmpId": menEmpId,
        "MenUsuario": menUsuario,
        "MenClase": menClase,
        "MenTipoMsn": menTipoMsn,
        "MenAsunto": menAsunto,
        "MenMensaje": menMensaje,
        "MenReplicaIdMsn": menReplicaIdMsn,
        "MenOkRecibido": menOkRecibido,
        "MenSendTo": menSendTo,
        "MenBloquearRespuesta": menBloquearRespuesta,
        "MenCategoriaId": menCategoriaId,
        "MenEstado": menEstado,
        "MenFechaMaxima": menFechaMaxima,
      };
}

class NewMessage {
  NewMessage({
    this.destinatarios,
    this.mensaje,
    this.adjuntos,
  });

  List<Destinatario> destinatarios;
  NewMessajeDto mensaje;
  List<dynamic> adjuntos;

  factory NewMessage.fromJson(Map<String, dynamic> json) => NewMessage(
        destinatarios: List<Destinatario>.from(
            json["destinatarios"].map((x) => Destinatario.fromJson(x))),
        mensaje: NewMessajeDto.fromJson(json["mensaje"]),
        adjuntos: List<dynamic>.from(json["adjuntos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "destinatarios":
            List<dynamic>.from(destinatarios.map((x) => x.toJson())),
        "mensaje": mensaje.toJson(),
        "adjuntos": List<dynamic>.from(adjuntos.map((x) => x)),
      };
}

class Destinatario {
  Destinatario({
    this.id,
    this.tipo,
  });

  int id;
  int tipo;

  factory Destinatario.fromJson(Map<String, dynamic> json) => Destinatario(
        id: json["id"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
      };
}
