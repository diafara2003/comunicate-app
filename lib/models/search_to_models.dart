// To parse this JSON data, do
//
//     final searchTo = searchToFromJson(jsonString);

import 'dart:convert';

class DestinatariosModel {
  int perId;
  int tipo;
  String nombre;
  String apellido;

  DestinatariosModel({this.perId, this.tipo, this.apellido, this.nombre});
}

List<SearchTo> searchToFromJson(String str) =>
    List<SearchTo>.from(json.decode(str).map((x) => SearchTo.fromJson(x)));

String searchToToJson(List<SearchTo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchTo {
  SearchTo({
    this.perId,
    this.perNombres,
    this.perApellidos,
    this.graDescripcion,
    this.curDescripcion,
    this.tipo,
    this.grEnColorRgb,
    this.grEnColorObs,
    this.grEnColorBurbuja,
  });

  int perId;
  String perNombres;
  String perApellidos;
  String graDescripcion;
  String curDescripcion;
  int tipo;
  String grEnColorRgb;
  String grEnColorObs;
  String grEnColorBurbuja;
  bool selected;

  factory SearchTo.fromJson(Map<String, dynamic> json) => SearchTo(
        perId: json["PerId"],
        perNombres: json["PerNombres"],
        perApellidos: json["PerApellidos"],
        graDescripcion: json["GraDescripcion"],
        curDescripcion: json["CurDescripcion"],
        tipo: json["tipo"],
        grEnColorRgb: json["GrEnColorRGB"],
        grEnColorObs: json["GrEnColorObs"],
        grEnColorBurbuja: json["GrEnColorBurbuja"],
      );

  Map<String, dynamic> toJson() => {
        "PerId": perId,
        "PerNombres": perNombres,
        "PerApellidos": perApellidos,
        "GraDescripcion": graDescripcion,
        "CurDescripcion": curDescripcion,
        "tipo": tipo,
        "GrEnColorRGB": grEnColorRgb,
        "GrEnColorObs": grEnColorObs,
        "GrEnColorBurbuja": grEnColorBurbuja,
      };
}
