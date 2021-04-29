// To parse this JSON data, do
//
//     final messageDetatails = messageDetatailsFromMap(jsonString);

import 'dart:convert';

import 'package:comunicate_colegios_app/models/person_models.dart';

class MessageDetatails {
  MessageDetatails({
    this.usuario,
    this.adjuntos,
    this.menId,
    this.menEmpId,
    this.menUsuario,
    this.menCategoriaId,
    this.menClase,
    this.menTipoMsn,
    this.menAsunto,
    this.menMensaje,
    this.menFecha,
    this.menReplicaIdMsn,
    this.menOkRecibido,
    this.menBloquearRespuesta,
    this.menSendTo,
    this.menEstado,
    this.menFechaMaxima,
  });
  List<MessageDetatails> messageDetatailsFromMap(String str) =>
      List<MessageDetatails>.from(
          json.decode(str).map((x) => MessageDetatails.fromMap(x)));

  String messageDetatailsToMap(List<MessageDetatails> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

  Usuario usuario;
  dynamic adjuntos;
  int menId;
  int menEmpId;
  int menUsuario;
  int menCategoriaId;
  int menClase;
  dynamic menTipoMsn;
  String menAsunto;
  String menMensaje;
  DateTime menFecha;
  int menReplicaIdMsn;
  int menOkRecibido;
  int menBloquearRespuesta;
  String menSendTo;
  int menEstado;
  DateTime menFechaMaxima;

  factory MessageDetatails.fromMap(Map<String, dynamic> json) =>
      MessageDetatails(
        usuario: Usuario.fromJson(json["usuario"]),
        adjuntos: json["adjuntos"],
        menId: json["MenId"],
        menEmpId: json["MenEmpId"],
        menUsuario: json["MenUsuario"],
        menCategoriaId: json["MenCategoriaId"],
        menClase: json["MenClase"],
        menTipoMsn: json["MenTipoMsn"],
        menAsunto: json["MenAsunto"],
        menMensaje: json["MenMensaje"],
        menFecha: DateTime.parse(json["MenFecha"]),
        menReplicaIdMsn: json["MenReplicaIdMsn"],
        menOkRecibido: json["MenOkRecibido"],
        menBloquearRespuesta: json["MenBloquearRespuesta"],
        menSendTo: json["MenSendTo"],
        menEstado: json["MenEstado"],
        menFechaMaxima: json["MenFechaMaxima"] == null
            ? null
            : DateTime.parse(json["MenFechaMaxima"]),
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toJson(),
        "adjuntos": adjuntos,
        "MenId": menId,
        "MenEmpId": menEmpId,
        "MenUsuario": menUsuario,
        "MenCategoriaId": menCategoriaId,
        "MenClase": menClase,
        "MenTipoMsn": menTipoMsn,
        "MenAsunto": menAsunto,
        "MenMensaje": menMensaje,
        "MenFecha": menFecha.toIso8601String(),
        "MenReplicaIdMsn": menReplicaIdMsn,
        "MenOkRecibido": menOkRecibido,
        "MenBloquearRespuesta": menBloquearRespuesta,
        "MenSendTo": menSendTo,
        "MenEstado": menEstado,
        "MenFechaMaxima": menFechaMaxima.toIso8601String(),
      };
}
