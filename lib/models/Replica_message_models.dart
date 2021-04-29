// To parse this JSON data, do
//
//     final replicaMsnDto = replicaMsnDtoFromMap(jsonString);

import 'dart:convert';

ReplicaMsnDto replicaMsnDtoFromMap(String str) =>
    ReplicaMsnDto.fromMap(json.decode(str));

String replicaMsnDtoToMap(ReplicaMsnDto data) => json.encode(data.toMap());

class DestinatariosDTO {
  DestinatariosDTO({
    this.id,
    this.tipo,
  });

  int id;
  String tipo;

  factory DestinatariosDTO.fromMap(Map<String, dynamic> json) =>
      DestinatariosDTO(
        id: json["id"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
      };
}

class ReplicaMsnDto {
  ReplicaMsnDto({
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

  factory ReplicaMsnDto.fromMap(Map<String, dynamic> json) => ReplicaMsnDto(
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
      );

  Map<String, dynamic> toMap() => {
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
      };
}
