// To parse this JSON data, do
//
//     final enviarMensajeDto = enviarMensajeDtoFromMap(jsonString);

import 'dart:convert';

import 'Replica_message_models.dart';

EnviarMensajeDto enviarMensajeDtoFromMap(String str) =>
    EnviarMensajeDto.fromMap(json.decode(str));

String enviarMensajeDtoToMap(EnviarMensajeDto data) =>
    json.encode(data.toMap());

class EnviarMensajeDto {
  EnviarMensajeDto({
    this.destinatarios,
    this.mensaje,
    this.adjuntos,
  });

  List<DestinatariosDTO> destinatarios;
  ReplicaMsnDto mensaje;
  List<dynamic> adjuntos;

  factory EnviarMensajeDto.fromMap(Map<String, dynamic> json) =>
      EnviarMensajeDto(
        destinatarios: List<DestinatariosDTO>.from(
            json["destinatarios"].map((x) => DestinatariosDTO.fromMap(x))),
        mensaje: ReplicaMsnDto.fromMap(json["mensaje"]),
        adjuntos: List<dynamic>.from(json["adjuntos"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "destinatarios":
            List<dynamic>.from(destinatarios.map((x) => x.toMap())),
        "mensaje": mensaje.toMap(),
        "adjuntos": List<dynamic>.from(adjuntos.map((x) => x)),
      };
}
